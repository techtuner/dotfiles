#!/bin/ash


# Aliasses for Personal Folder
alias personal="cd ~/workspace/Personal"
alias projects="cd ~/workspace/Personal/Projects"
alias dots="cd ~/workspace/Personal/Projects/dotfiles"  

# Aliases for general stuff
alias python="python3"
alias ls="eza"
alias vim="nvim"
alias gs="git status"
alias src="source ~/.bashrc"
alias e="exit"

# Function to clone github repo via github cli
function ghclone() {
    if [[ $# -ne 2 ]]; then
        echo "Usage: ghclone <username> <repository>"
        return 1
    fi

    local username=$1
    local repository=$2

    gh repo clone "https://github.com/$username/$repository.git"
    set -e "Run gh auth login to configure Github CLI"
}

# Update the system
function update-system(){
  sudo apt --fix-broken install -y
  sudo apt update -y
  sudo apt full-upgrade -y
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
}
