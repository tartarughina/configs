# ports: list listening TCP/UDP sockets in fzf, preview the owning process, kill it.
#   ports        your processes only (no sudo)
#   ports -a     all processes (uses sudo)
#   ports 8080   start with the query "8080"
# Keys: enter = kill (TERM), ctrl-k = kill -9, ctrl-r = reload

typeset -g _PORTS_FILE=${${(%):-%x}:A}

# Columns: PROTO PORT ADDRESS PID PROCESS ("-" when the owner isn't visible)
# Backend: ss on Linux (fast, lists every listener even without root),
# lsof elsewhere, e.g. macOS (only your own processes unless run with sudo).
_ports_list() {
  if (( $+commands[ss] )) && [[ $OSTYPE == linux* ]]; then
    _ports_list_ss "$1"
  else
    _ports_list_lsof "$1"
  fi | sort -k2,2n -k1,1 | uniq
}

_ports_list_ss() {
  ${=1} ss -Htlnup 2>/dev/null | awk '
    {
      proto=$1; local=$5; port=local; sub(/.*:/, "", port); addr=local; sub(/:[^:]*$/, "", addr)
      name="-"; pid="-"
      if (match($0, /users:\(\("[^"]+",pid=[0-9]+/)) {
        s=substr($0, RSTART+9, RLENGTH-9); split(s, a, "\",pid="); name=a[1]; pid=a[2]
      }
      printf "%-4s %-6s %-26s %-8s %s\n", proto, port, addr, pid, name
    }'
}

# lsof -F prints one field per line: p<pid>, c<command>, then per socket
# P<protocol> and n<address:port>. Connected UDP sockets ("a->b") are skipped.
# Two calls: in a single call -sTCP:LISTEN also filters out every UDP socket.
_ports_list_lsof() {
  { ${=1} lsof -nP -iTCP -sTCP:LISTEN -F pcPn; ${=1} lsof -nP -iUDP -F pcPn } 2>/dev/null | awk '
    /^p/ { pid=substr($0, 2) }
    /^c/ { name=substr($0, 2) }
    /^P/ { proto=tolower(substr($0, 2)) }
    /^n/ {
      local=substr($0, 2); if (local ~ /->/) next
      port=local; sub(/.*:/, "", port); addr=local; sub(/:[^:]*$/, "", addr)
      if (port == "*") next
      printf "%-4s %-6s %-26s %-8s %s\n", proto, port, addr, pid, name
    }'
}

ports() {
  local sudo=""
  if [[ $1 == -a ]]; then
    sudo=sudo; shift
    sudo -v || return
  fi
  local reload="zsh -fc 'source ${(q)_PORTS_FILE}; _ports_list $sudo'"

  _ports_list "$sudo" | fzf \
    --query="$*" --no-sort --layout=reverse --height=80% \
    --header=$'enter: kill (TERM) │ ctrl-k: kill -9 │ ctrl-r: reload\nPROTO PORT   ADDRESS                    PID      PROCESS' \
    --preview="if [[ {4} == - ]]; then echo 'Owner not visible: rerun with  ports -a'; exit; fi
               $sudo ps -o pid,ppid,user,etime,%cpu,%mem -p {4}; echo
               $sudo ps -o args= -p {4}; echo
               $sudo lsof -Pan -p {4} -i 2>/dev/null | tail -n +2" \
    --preview-window=down:50%:wrap \
    --bind="enter:execute-silent([[ {4} != - ]] && $sudo kill {4})+reload($reload)" \
    --bind="ctrl-k:execute-silent([[ {4} != - ]] && $sudo kill -9 {4})+reload($reload)" \
    --bind="ctrl-r:reload($reload)"
}
