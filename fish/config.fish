set fish_greeting
zoxide init fish | source

# aliases
alias v=nvim
alias lg=lazygit
alias la="ls -a"
alias ll="ls -la"
alias ls="ls -FG"
alias lat="latexmk -pvc -pdf -interaction=nonstopmode -shell-escape"
alias lg=lazygit
alias cpr=colorpicker
alias alt="sudo alternatives --config"
alias bs="brew search"
alias bi="brew install"

# functions
function cs
    curl cheat.sh/$argv
end

# environment variables
set -x ESCDELAY 1
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden'
# set -x FZF_DEFAULT_OPTS '--color=bg+:#39424D'
set -x FZF_DEFAULT_OPTS '--no-separator'

set -x FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS'
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
set -x _ZO_FZF_OPTS $FZF_DEFAULT_OPTS

set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
