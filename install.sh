#!/bin/bash
script_dir="$(dirname $(readlink -f $0))"
conf_dir=$HOME/.config

# linked files
files="bspwm sxhkd polybar dunst fontconfig alacritty nvim rofi picom"
dotfiles=".zshrc .tmux.conf .Xmodmap"

# create config folder if it doesn't exist
if [ ! -d $conf_dir ]; then
    echo Creating $conf_dir
    mkdir $conf_dir
fi

# config files
for file in $files
do
    echo Linking $script_dir/$file to $conf_dir/$file
    ln -sf $script_dir/$file $conf_dir/$file
done

# dotfiles
for dotfile in $dotfiles
do
    echo Linking $script_dir/$dotfile to $HOME/$dotfile
    ln -sf $script_dir/$dotfile $HOME/$dotfile
done

echo Done!
