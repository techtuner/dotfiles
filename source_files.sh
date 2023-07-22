#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo "exec zsh" >> ~/.bashrc
source ~/.bashrc
source ~/.zshrc

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export GOROOT=/usr/local/go >> ~/.bashrc
export GOPATH=$HOME/go >> ~/.bashrc
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH >> ~/.bashrc

nvm install --lts
nvm use 18.17.0