# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /Users/david/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

set fish_greeting
zoxide init fish | source
pyenv init - | source

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
# set -x FZF_DEFAULT_OPTS '--color=bg+:#39424D'
set -x FZF_DEFAULT_OPTS '--no-separator'

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

if status is-interactive and not set -q TMUX
    if tmux has-session > /dev/null 2>&1
        exec tmux attach
    else
        exec tmux
    end
end
