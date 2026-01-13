# fzf search existing tmux sessions or create a new one named with query
tma() {
  local query session
  { read -r query; read -r session } <<< "$(tmux ls -F '#{session_name}' 2>/dev/null | fzf \
      --style minimal --tmux --reverse --height=60% \
      --border --algo=v1 --prompt="attach> " \
      --preview-label=" tmux sessions " --preview-label-pos=top --preview-window=border-rounded \
    --preview '$HOME/.config/tmux/scripts/tmux_tree_arc.sh {} | bat --style=plain --color=always' \
    --preview-window=right:70% --print-query)"
  [[ -n "$session" ]] && tmux attach -t "$session" || [[ -n "$query" ]] && tmux new -s "$query"
}
