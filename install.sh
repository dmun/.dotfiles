#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

conf_dir=$HOME/.config

if [ ! -d $conf_dir ]; then
    mkdir $conf_dir
fi

# folders that go in the config directory
for path in $dir/*/
do
    file=$(basename $path)
    ln -sf $path $conf_dir/$file
done

# dotfiles that go in the root directory
for path in $dir/.*
do
    file=$(basename $path)
    if [ ${#file} -gt 2 ] && [ $file != ".git" ]; then
        ln -sf $path $HOME/$file
    fi
done
