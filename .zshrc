# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.secrets ] && source ~/.secrets

export PATH
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:$HOME/.cargo/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export VCPKG_ROOT="/Users/david/Development/vcpkg"
export OBSIDIAN_VAULT="/Users/david/Library/Mobile Documents/iCloud~md~obsidian/Documents/iCloud"
