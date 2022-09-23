# zmodload zsh/zprof

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export PATH=$PATH:$HOME/.local/share/neovim/bin
export PATH=$PATH:$HOME/.cargo/bin
export GOPATH=~/work/go
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Antigen
if command -v brew &> /dev/null
then
    source $(brew --prefix)/share/antigen/antigen.zsh
else
    source /usr/local/share/antigen/antigen.zsh
fi

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle denysdovhan/spaceship-prompt

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_GOLANG_SYMBOL=" " 
SPACESHIP_PHP_SYMBOL=" " 
SPACESHIP_DOCKER_SYMBOL=" " 
SPACESHIP_PYENV_SYMBOL=" " 
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PYENV_SHOW=true

antigen apply

# History
SAVEHIST=1000
HISTFILESIZE=1000
HISTSIZE=1000
HISTFILE=~/.zsh_history

export NeovideMultiGrid=true
export _JAVA_AWT_WM_NONREPARENTING=1
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# ls
alias la="ls -a"
alias ll="ls -la"
alias ls="ls -FG"

set -o vi
alias lg=lazygit
alias cpr=colorpicker
alias alt="sudo alternatives --config"
alias v=nvim

# homebrew
alias bs="brew search"
alias bi="brew install"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/david/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/david/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/david/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/david/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# zprof
