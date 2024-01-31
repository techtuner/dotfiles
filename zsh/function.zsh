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
  sudo apt autoremove -y
}
