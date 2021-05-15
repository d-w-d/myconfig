#!/usr/bin/env false

### Make sure functions are sourced
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}
source $MYCONFIG_ROOT_DIR/COMMON/common_functions.sh

##################################################
# Source this file via alias 'alnvm'
##################################################

[ ! $ZSH_VERSION ] && echo "INITIALIZING NVM"
export NVM_DIR="$HOME/.nvm"

source "$NVM_DIR"/nvm.sh

# Add node executables globally installed by nvm-enables npm
export PATH="$PATH:$NVM_BIN"
