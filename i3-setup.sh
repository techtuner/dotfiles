#!/bin/bash

echo "Installing i3 setup files"

sudo apt install tmux i3 i3-wm kitty feh dmenu rofi polybar picom zsh -y

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp -r ./kitty/ ~/.config/
cp -r ./i3/ ~/.config/
cp -r ./polybar/ ~/.config/
cp -r ./rofi/ ~/.config/
cp -r ./picom/ ~/.config/
cp ./tmux/.tmux.conf ~