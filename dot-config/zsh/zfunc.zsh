# Keeps ~/.zfunc/_<name> completion files in sync with the installed tools.
# A file is regenerated when the tool's binary is newer than it (so brew,
# toolbox, rustup, ... upgrades are all picked up on the next shell).
#
# Add a tool: add an entry below (or, for machine-specific tools, set
#   typeset -gA ZFUNC_GEN=( name 'cmd completion zsh' ... )
# in .zshrc BEFORE sourcing this file), then run
#   zfunc-update && rm -f ~/.zcompdump* && exec zsh
# Force a full rebuild: zfunc-update -f
# Tools that aren't installed are skipped.

typeset -gA ZFUNC_GEN
ZFUNC_GEN+=(
  docker          'docker completion zsh'
  codex           'codex completion zsh'
  git-lfs         'git-lfs completion zsh'
  rustup          'rustup completions zsh'
  usage           'usage --completions zsh'
  rex             'rex completion zsh'
)

zfunc-update() {
  local name cmd bin out file
  mkdir -p ~/.zfunc
  for name cmd in ${(kv)ZFUNC_GEN}; do
    bin=${commands[${cmd%% *}]}
    [[ -n $bin ]] || continue                     # tool not installed
    file=~/.zfunc/_$name
    [[ $1 == -f || ! -e $file || $bin -nt $file ]] || continue
    out=$(${(z)cmd} 2>/dev/null </dev/null) || continue
    [[ $out == *'#compdef'* ]] || continue        # keep old file on bad output
    print -r -- $out >| $file
  done
}

# Check in the background at startup; the subshell avoids job-control noise.
( zfunc-update & )
