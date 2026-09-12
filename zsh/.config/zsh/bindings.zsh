bindkey -v
autoload -U edit-command-line
zle -N edit-command-line

bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history
bindkey '^[[2~' overwrite-mode
bindkey '^[[1;3C' forward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;3~' kill-word
bindkey '^[[3;5~' kill-word

# For entering a newline without execution
bindkey '^J' self-insert
bindkey -s '^[[27;2;13~' '^J'

bindkey -M viins '^[[D' backward-char
bindkey -M viins '^[[C' forward-char
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^[b' backward-word
bindkey -M viins '^[f' forward-word
bindkey -M viins '^[^?' backward-delete-word
bindkey -M viins '^U' kill-whole-line

bindkey '^X^E' edit-command-line
bindkey '^[OF' end-of-line
bindkey '^[OH' beginning-of-line
#bindkey '^[[5~' up-line-or-history
#bindkey '^[[6~' down-line-or-history
bindkey ' ' magic-space
