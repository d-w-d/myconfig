#!/usr/bin/env false

##################################################
# Source this file via alias 'alnvm'
##################################################

echo "INITIALIZING NVM"
export NVM_DIR="$HOME/.nvm"
source "$HOME/.nvm/nvm.sh"
nvm use 10

# Safety measure recommended by this dude: https://youtu.be/24tQRwIRP_w?t=961
# npm config set ignore-scripts true    # "safe" but pain-in-derriere
npm config set ignore-scripts false     # "unsafe" but practical

# Enable the node REPL to find global node_modules
export NODE_PATH="$(npm config get prefix)/lib/node_modules"

# Add node executables globally installed by nvm-enables npm 
export PATH="$PATH:$NVM_BIN"

