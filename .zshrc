export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

plugins=(git sudo tmux zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/zsh/function.zsh
source ~/zsh/aliases.zsh

export PATH=$PATH:~/.cargo/bin:/~/.local/bin
