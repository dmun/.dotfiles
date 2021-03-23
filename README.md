# dotfiles
This repository contains my configuration files for alacritty, bspwm, neofetch, nvim, picom, polybar, rofi and sxhkd.

Running `./install.sh` will create links in the designated directories to the configuration files.

## Setup
Follow the steps to use the dotfiles.
### Packages
```
sudo apt install bspwm neofetch neovim polybar pulseaudio feh
```

### Vim-plug
1. Install using this command
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
2. Open neovim and run
```
:PlugInstall
```

### Rofi
1. Install the dependencies
```
sudo apt install build-essential make autoconf automake pkg-config flex bison check libpango libpangocairo libcairo libcairo-xcb libglib2.0 libgdk-pixbuf-2.0 libstartup-notification-1.0 libxkbcommon libxkbcommon-x11 libxcb xcb-util xcb-util-wm xcb-util-xrm meson ninja
```
2. Clone the repository, preferably in ~/Downloads
```
git clone https://github.com/davatorium/rofi
cd rofi/
```
3. Build and install
```
meson setup build
ninja -C build
ninja -C build install
```

### Rofi Power Menu
1. Clone the repository
```
git clone https://github.com/jluttine/rofi-power-menu
cd rofi-power-menu/
```
2. Copy the script to the binary directory
```
sudo cp rofi-power-menu /bin/
```

### Pulsemixer
1. Install pulsemixer
```
curl https://raw.githubusercontent.com/GeorgeFilipkin/pulsemixer/master/pulsemixer > pulsemixer && chmod +x ./pulsemixer
```

### ~~Picom~~
### ~~Polybar~~
