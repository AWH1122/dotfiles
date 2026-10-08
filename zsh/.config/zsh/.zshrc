# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
fi

WORDCHARS='*?_[]~=&;!#$%^(){}<>'
KEYTIMEOUT=1

HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$XDG_STATE_HOME/zsh/history"
setopt extendedhistory
setopt histignoredups
setopt histverify
setopt sharehistory
setopt histfindnodups
setopt histnostore

setopt autocd autopushd pushdminus
setopt completeinword alwaystoend
setopt extendedglob
setopt noflowcontrol longlistjobs
setopt interactivecomments
unsetopt beep nomatch

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' ignored-patterns '..' '.'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'
zstyle '*' single-ignored show
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

export LS_COLORS='di=38;2;140;170;238:ln=38;2;140;170;238:ex=38;2;166;209;137:pi=38;2;181;191;226:so=38;2;181;191;226:bd=38;2;234;153;156:cd=38;2;234;153;156:or=38;2;231;130;132:mi=38;2;231;130;132:fi=38;2;198;208;245:su=38;2;202;158;230:sg=38;2;202;158;230:'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

fpath=("$XDG_DATA_HOME/zsh/completions" $fpath)

autoload -Uz compinit zrecompile
ZDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

if [[ ! -s "$ZDUMP" || -n "$ZDUMP"(#qN.mh+24) || ! -s "${ZDUMP}.zwc" || "$ZDUMP" -nt "${ZDUMP}.zwc" ]]; then
    compinit -i -d "$ZDUMP"
    zrecompile -p -q "$ZDUMP"
else
    compinit -C -d "$ZDUMP"
fi

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source "$XDG_DATA_HOME/zsh/plugins/history-substring-search/history-substring-search.plugin.zsh"
source "$XDG_DATA_HOME/zsh/plugins/ssh/ssh.plugin.zsh"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.config/zsh/.p10k.zsh ]] && source ~/.config/zsh/.p10k.zsh

zle_highlight=('paste:none')

source <(fzf --zsh)
eval "$(zoxide init zsh)"

zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/bindings.zsh"
