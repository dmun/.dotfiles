if [[ -z $TMUX ]]
then 
  if [[ ! $(tmux list-sessions) ]]
  then
    exec tmux
  else
    exec tmux a
  fi
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

parse_git_branch() {
    git branch --show 2> /dev/null | sed -E 's/(.+)/ (\1)/g'
}

setopt PROMPT_SUBST
PROMPT=""
PROMPT+="%F{10}%n"
PROMPT+="%F{7}@"
PROMPT+="%F{7}%m"
PROMPT+=" "
PROMPT+="%F{2}%(4~|…/%3~|%~)"
PROMPT+='%F{7}$(parse_git_branch)'
PROMPT+="%F{7}> "

# Antigen
[ ! -f ~/.antigen.zsh ] && curl -L git.io/antigen > .antigen.zsh
[ -f ~/.antigen.zsh ] && source ~/.antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle sindresorhus/pure

export ESCDELAY=0
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
  --color=fg:-1,bg:-1,fg+:0,bg+:7
  --color=hl:10,hl+:blue,info:8,marker:2
  --color=prompt:7,spinner:6,pointer:#af5fff,header:#87afaf
  --color=gutter:-1,border:8,label:#aeaeae,query:#d9d9d9
  --color=info:8
  --marker="▌"
  --prompt="/"
  --pointer=""
  --separator=""
  --scrollbar=""
  --height=40%
  --layout=reverse'
export _ZO_FZF_OPTS=$FZF_DEFAULT_OPTS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias v=nvim
alias lg=lazygit
alias pac='sudo pacman -S'
alias par='paru -S'

alias pacs="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pacr="pacman -Qeq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"

alias pars="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
alias parr="paru -Qeq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro paru -Rns"

eval "$(zoxide init zsh)"
