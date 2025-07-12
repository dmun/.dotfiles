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
alias pacr='sudo pacman -R'
alias pacs='pacman -Ss'

alias par='paru -S'
alias pars='paru -Ss'
alias parr='paru -R'

eval "$(zoxide init zsh)"

if [[ -n $TMUX_AUTOSTART ]] && [[ -z $TMUX ]] && [[ ! $(tmux list-sessions) ]]
then 
  exec tmux
elif [[ -n $TMUX_AUTOSTART ]] && [[ -z $TMUX ]]
then
  exec tmux a
fi
