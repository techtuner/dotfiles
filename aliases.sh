# Cloning and changing into a git repository
function gcd() {
  if [ ! -d $2 ]; then
    git clone https://www.github.com/$1/$2 && cd $2
  else
    cd $2
  fi
}

alias src="source ~/.bashrc"
alias e="exit"
alias python="python3"
alias pip="pip3"
alias dots="cd ~/Projects/dotfiles && ls"
alias wall="cd ~/Pictures/wallpapers && gio ."
alias nano="~/.local/bin/babi"
alias babi="nano"
alias tmux="tmux -u"