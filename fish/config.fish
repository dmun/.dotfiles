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
