# dotfiles
Running `./install.sh` will create links in the designated directories to the configuration files.

## Setup
### Packages
```
sudo pacman -S antigen bspwm  light lxappearance mcmojava-cursors-git neofetch neovim-nightly-bin nodejs noto-fonts noto-fonts-cjk noto-fonts-emoji npm picom polybar pulseaudio rofi sxhkd scrot ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-roboto vimix-gtk-themes-git yarn zathura zsh
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
