# Antigen
source /usr/share/zsh/share/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle denysdovhan/spaceship-prompt

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_GOLANG_SYMBOL=" " 
export SPACESHIP_PHP_SYMBOL=" " 
export SPACESHIP_DOCKER_SYMBOL=" " 
export SPACESHIP_PYENV_SYMBOL=" " 
export SPACESHIP_VI_MODE_SHOW=false

antigen apply

# History
SAVEHIST=1000
HISTFILESIZE=1000
HISTSIZE=1000
HISTFILE=~/.zsh_history

set -o vi
alias lg=lazygit
alias cpr=colorpicker
