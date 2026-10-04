alias ls='eza'
alias l='ls -l --group-directories-first --icons=auto'
alias la='l -a'
alias ldot='ls -ld .*'
alias lt='eza -l --tree --level=2 --icons=auto'
alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

alias grep='grep --color'
alias cat='bat'

alias diff='diff --color'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| rg'
alias -g L="| less"

alias dud='du -d 1 -h'

## History wrapper
function history {
  # parse arguments and remove from $@
  local clear list stamp REPLY
  zparseopts -E -D l=list f=stamp E=stamp i=stamp t:=stamp
  if [[ $# -eq 0 ]]; then
    # if no arguments provided, show full history starting from 1
    builtin fc "${stamp[@]}" -l 1
  else
    # otherwise, run `fc -l` with a custom format
    builtin fc "${stamp[@]}" -l "$@"
  fi
}
alias h='history -i'

autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help

alias help=run-help
alias rm='trash'
alias mv='mv -i'

alias ...='cd ../..'
alias ....='cd ../../..'
