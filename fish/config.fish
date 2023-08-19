eval(/opt/homebrew/bin/fish shellenv)

# Add custom scripts to ~/.config/bin
fish_add_path ~/.config/bin

# Disbaled Fish greeting
set -U fish_greeting

# Editor Nvim
set -Ux EDITOR Nvim

# Aliases
abbr bi "brew install"
abbr bic "brew install --cask"

