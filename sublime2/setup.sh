#!/bin/sh
# Setup a machine for Sublime Text 2

# symlink settings in
sublime_dir=~/Library/Application\ Support/Sublime\ Text\ 2/Packages
mv "$sublime_dir/User" "$sublime_dir/User.backup"
ln -s "$HOME/dotfiles/sublime2/User" "$sublime_dir"

# Grab the Soda theme
cd "$sublime_dir"
git clone https://github.com/buymeasoda/soda-theme/ "Theme - Soda"