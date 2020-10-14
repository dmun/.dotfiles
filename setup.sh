#!/bin/bash

dotfiles=(".bashrc" ".tmux.conf")

for dotfile in "${dotfiles[@]}";do
    ln -sf "${HOME}/dotfiles/${dotfile}" "${HOME}/${dotfile}" 
done


