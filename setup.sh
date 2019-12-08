#!/bin/bash

# set -x
stow_list="herbstluftwm xresources zsh"

function error_exit()
{
    echo "$@"
    exit 1
}

function run()
{
    command="$1"
    shift
    type "$command" &>/dev/null && "$command" $@ || error_exit "'$command' not installed" 
}


[ -d "$HOME/.config" ] || mkdir -pv "$HOME/.config"

run stow -vv "$stow_list"
run wget -i wallpapers.txt -P wallpapers

exit 0
