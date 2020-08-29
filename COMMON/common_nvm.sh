#!/usr/bin/env false

### Make sure functions are sourced
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}
source $MYCONFIG_ROOT_DIR/COMMON/common_functions.sh

##################################################
# Source this file via alias 'alnvm'
##################################################

[ ! $ZSH_VERSION ] && echo "INITIALIZING NVM"
export NVM_DIR="$HOME/.nvm"
#source "$HOME/.nvm/nvm.sh"
#nvm use 10 
#if [[ $ZSH_VERSION ]]; then
#nvm use 10 >/dev/null
#else
#nvm use 10
#fi

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(fun_data_type __init_nvm)" = function ]; then
    #echo "hmmmmmmmmm"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
    declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
    function __init_nvm() {
        for i in "${__node_commands[@]}"; do unalias $i; done
        source "$NVM_DIR"/nvm.sh
        unset __node_commands
        unset -f __init_nvm
    }
    for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

# Safety measure recommended by this dude: https://youtu.be/24tQRwIRP_w?t=961
# npm config set ignore-scripts true    # "safe" but pain-in-derriere
#npm config set ignore-scripts false # "unsafe" but practical

# Enable the node REPL to find global node_modules
#export NODE_PATH="$(npm config get prefix)/lib/node_modules"

# Add node executables globally installed by nvm-enables npm
export PATH="$PATH:$NVM_BIN"
