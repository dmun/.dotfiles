# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

PROMPT=""
PROMPT+="%F{3}%n"
PROMPT+="%F{7}@"
PROMPT+="%F{5}%m"
PROMPT+="%F{7}:"
PROMPT+="%F{4}%~"
PROMPT+="%F{7}%% "

# Antigen
[ ! -f ~/.antigen.zsh ] && curl -L git.io/antigen > .antigen.zsh
[ -f ~/.antigen.zsh ] && source ~/.antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle sindresorhus/pure

export EDITOR=nvim
set -o emacs

antigen apply
autoload edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

autoload -Uz compinit
compinit

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --style=full:sharp
  --no-border
  --no-header-border
  --no-input-border
  --no-list-border
  --color=fg:-1,fg+:#ffffff,bg:-1,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=gutter:0,border:8,label:#aeaeae,query:#d9d9d9
  --border=sharp
  --color=info:8
  --prompt="/"
  --marker=">" --pointer=" " --separator="" --scrollbar=""
  --height=40%
  --layout=reverse
  --info="inline"'

export _ZO_FZF_OPTS=$FZF_DEFAULT_OPTS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.secrets ] && source ~/.secrets


alias v=nvim
alias lg=lazygit
alias pac='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacr='sudo pacman -Rs'
alias pacs='pacman -Ss'
alias paci='pacman -Si'
alias paclo='pacman -Qdt'
alias pacro='paclo && sudo pacman -Rns $(pacman -Qtdq)'
alias pacc='pacman -Scc'
alias paclf='pacman -Ql'

alias par='paru -S'
alias pars='paru -Ss'
alias parr='paru -R'

export PATH
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:$HOME/.cargo/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export ESCDELAY=1

export VCPKG_ROOT="/Users/david/Development/vcpkg"
export OBSIDIAN_VAULT="/Users/david/Library/Mobile Documents/iCloud~md~obsidian/Documents/iCloud"

eval "$(zoxide init zsh)"

# fnm
FNM_PATH="/home/david/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/david/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

if [[ -z $TMUX ]] && [[ ! $(tmux list-sessions) ]]
then 
  exec tmux
elif [[ -z $TMUX ]]
then
  exec tmux a
fi

