# Installation script for Mac OS Machine
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # INstall Homebrew, Package manager for MacOOS
brew update
brew install --cask iterm2
brew install --cask firefox
brew install --cask neovim
brew install tmux

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash  # Installling NVM Node manager
node install stable
brew install --cask visual-studio-code
brew install git
brew install --cask alfred
brew install --cask spectacle
