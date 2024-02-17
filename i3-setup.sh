#!/bin/bash

echo "Installing i3 setup files"

sudo apt install tmux i3 i3-wm kitty feh dmenu rofi polybar picom -y

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp -r ./kitty/ ~/.config/
cp -r ./i3/ ~/.config/
cp -r ./polybar/ ~/.config/
cp -r ./rofi/ ~/.config/
cp -r ./picom/ ~/.config/
cp ./tmux/.tmux.conf ~


