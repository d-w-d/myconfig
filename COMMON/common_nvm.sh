#!/usr/bin/env false

# if [[ ! -d ~/.zsh-nvm ]]; then
# git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
# fi

# Source zsh plugin even if we are using bash!
# source ~/.zsh-nvm/zsh-nvm.plugin.zsh

# Enables nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
