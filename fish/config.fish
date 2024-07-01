# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /Users/david/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

set fish_greeting
zoxide init fish | source

# aliases
alias nv=nvim
alias lg=lazygit
alias la="ls -a"
alias ll="ls -la"
alias ls="ls -FG"
alias lat="latexmk -pvc -pdf -interaction=nonstopmode -shell-escape"
alias lg=lazygit
alias cpr=colorpicker
alias alt="sudo alternatives --config"
alias nv=nvim
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
set -x FZF_DEFAULT_OPTS '--color=bg+:#39424D'
