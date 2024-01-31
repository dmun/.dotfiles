# zmodload zsh/zprof

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:$HOME/.cargo/bin
# export PATH=$PATH:/Users/david/Library/Python/3.10/lib/python/site-packages
# export GOPATH=~/work/go
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NODE_OPTIONS=--openssl-legacy-provider

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc


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
# antigen bundle jeffreytse/zsh-vi-mode

SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_GOLANG_SYMBOL=" " 
SPACESHIP_PHP_SYMBOL=" " 
SPACESHIP_DOCKER_SYMBOL=" " 
# SPACESHIP_PYTHON_SYMBOL=" " 
# SPACESHIP_VI_MODE_SHOW=false
# SPACESHIP_PYTHON_SHOW=false

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

# set -o vi
alias lg=lazygit
alias cpr=colorpicker
alias alt="sudo alternatives --config"
alias nv=nvim

# homebrew
alias bs="brew search"
alias bi="brew install"
alias lat="latexmk -pvc -pdf -interaction=nonstopmode -shell-escape"
export HDF5_DIR=/opt/homebrew/

alias mucc="muc --file $HISTFILE --count 10 --pretty --bar '*' --bar-open '(' --bar-close ')'"

# alias java-17="export JAVA_HOME=`/usr/libexec/java_home -v 17`; java -version"
# alias java-18="export JAVA_HOME=`/usr/libexec/java_home -v 18`; java -version"
# export JAVA_HOME=`/usr/libexec/java_home -v 17`
# export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/david/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/david/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/david/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/david/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# zprof

# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#2A2B3E,bg:-1,gutter:-1,spinner:3,hl:1 \
--color=fg:#CDD6F4,header:1,info:#B4BEFE,pointer:4 \
--color=marker:3,fg+:#CDD6F4,prompt:#CBA6F7,hl+:1 \
--color=border:4 --info=inline-right"
#2A2B3E
##3e4b6c
export BAT_THEME="Catppuccin-mocha"

source ~/.secrets

cs ()
{
    curl "cheat.sh/$1"
}
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export XDG_CONFIG_HOME="$HOME/.config"
export ZVM_KEYTIMEOUT=0
export EDITOR=nvim

autoload edit-command-line
zle -N edit-command-line
bindkey -e
set -o emacs
bindkey '^Xe' edit-command-line
export ESCDELAY=1
