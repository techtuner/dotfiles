# Cloning and changing into a git repository
function gcd() {
  echo "Cloning $2 from github by $1"
  if [ ! -d $2 ]; then
    git clone https://www.github.com/$1/$2 && cd $2
  else
    cd $2
  fi
}

# Update the system
function update-system(){
  echo "Updating the system"
  sudo apt --fix-broken install -y
  sudo apt update -y
  sudo apt full-upgrade -y
  sudo apt autoremove -y
}

alias src="source ~/.bashrc"
alias e="exit"
alias python="python3"
alias pip="pip3"
alias dots="cd ~/workspace/Personal/Projects/dotfiles && ls"
alias wall="cd ~/Pictures/wallpapers && gio ."
alias nano="~/.local/bin/babi"
alias babi="nano"
alias tmux="tmux -u"
alias ls="exa"
alias ls -la="exa -la"
alias lg="lazygit"
alias personal="cd ~/workspace/Personal"
