#!/usr/bin/env false

if [[ ! -d ~/.zsh-nvm ]]; then
  git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
fi

# Source zsh plugin even if we are using bash!
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
