# dotfiles
Running `./install.sh` will create links in the designated directories to the configuration files.

## Setup
### Packages
```
sudo apt install awesome neovim pulseaudio rofi pulsemixer light
```

### Vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
In neovim:
```
:PlugInstall
```

### Picom
Install from `https://github.com/ibhagwan/picom`
