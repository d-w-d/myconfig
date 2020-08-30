#!/usr/bin/env false

### Make sure functions are sourced
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}
source $MYCONFIG_ROOT_DIR/COMMON/common_functions.sh

##################################################
# Source this file via alias 'alnvm'
##################################################

[ ! $ZSH_VERSION ] && echo "INITIALIZING NVM"
export NVM_DIR="$HOME/.nvm"

### Adapted from: https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html 
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(fun_data_type __init_nvm)" = function ]; then
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


    export NODE_PATH="$(npm config get prefix)/lib/node_modules"

fi

# Safety measure recommended by this dude: https://youtu.be/24tQRwIRP_w?t=961
# npm config set ignore-scripts true    # "safe" but pain-in-derriere
#npm config set ignore-scripts false # "unsafe" but practical

# Add node executables globally installed by nvm-enables npm
export PATH="$PATH:$NVM_BIN"
