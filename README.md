# dotfiles
This repository contains my configuration files for alacritty, bspwm, neofetch, nvim, picom, polybar, rofi and sxhkd.

Running `./setup.sh` will create symbolic links for the configuration files.

## Requirements:
### Installing packages
1. `sudo apt install bspwm neofetch neovim polybar`

### Installing vim-plug
1. `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
2. Open neovim and run `:PlugInstall`

todo...
rofi pulsemixer picom powermenu
