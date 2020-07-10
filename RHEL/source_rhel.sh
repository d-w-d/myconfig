#!/usr/bin/env false

##############################################################
### Inherit $MYCONFIG_ROOT_DIR from parent script
##############################################################
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

### Source 'em:
source $MYCONFIG_ROOT_DIR/RHEL/rhel_aliases.sh
source $MYCONFIG_ROOT_DIR/RHEL/rhel_env.sh
source $MYCONFIG_ROOT_DIR/RHEL/rhel_git.sh
