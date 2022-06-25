# Dotfiles
# Dotfiles

My configuration for Ubuntu, Monjaro, Windows Operating System.

## Tools I Use
1. [Neovim](https://neovim.io/) - Text Editor
2. [Visual Studio Code](https://code.visualstudio.com/)- Text Editor
3. [Zsh](https://www.zsh.org/) - Unix Shell
4. [Oh-my-zsh](https://ohmyz.sh/) - Shell Theme
5. [Tmux](https://github.com/tmux/tmux/wiki) - Terminal Multiplexer
6. [Vim-Plug](https://github.com/junegunn/vim-plug) - Neovim Plugin Manager
7. [tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
8. [Hyper Terminal](https://hyper.is/) - Terminal Emulator
9. [Python3](https://www.python.org/) - Programming Language
10. Font Family: [Monaco](./fonts/Monaco/)

## Requirements

1. Python3
2. Oh-My-Zsh
3. Git
4. Zsh
5. Curl

## Installation

```shell

sudo apt-get install lightdm zsh curl git -y
git clone https://www.github.com/techtuner/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh

```

### To run Virtual Machines in Windows, disable hyper-v:
1. Run `cmd` as administrator
2. Run the following code

```console

bcdedit /set hypervisorlaunchtype off

```
3. Restart Windows and run Virtual Machine.

## Configuration

1. [Neovim](./nvim/init.vim)
2. [Tmux](./tmux/.tmux.conf)
3. [Visual Studio Code](./code/settings.json)
4. [Powershell](./powershell/user_profile.ps1)

