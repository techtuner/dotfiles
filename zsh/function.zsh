#!/bin/zsh
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


function update-system (){
  sudo apt --fix-broken install -y
  sudo apt update -y
  sudo apt full-upgrade -y
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
}

function virtual(){
VENV_DIR="myenv"

# Checks if the virtual environment exists and creates it if not
if [[ ! -d "$VENV_DIR" ]]; then
    echo "Virtual environment '$VENV_DIR' does not exist. Creating it under the user directory"
    cd ~
    sudo apt install python3-venv -y
    python3 -m venv myenv
    source "$VENV_DIR/bin/activate" 
   return 1
fi

# Check if the Virtual environment is already active
if [[ "$VIRTUAL_ENV" == "$VENV_DIR" ]]; then
    echo "Virtual Environment '$VENV_DIR' is already activated"
    return 0
fi

# Check for deactivate command argument
if [[ "$1" == "deactivate" ]]; then
    deactivate
    echo "Virtual Environment '$VENV_DIR' is deactivated"
else
    cd ~
    source "$VENV_DIR/bin/activate"
    echo "Virtual Environment '$VENV_DIR' is activated"
fi
}
