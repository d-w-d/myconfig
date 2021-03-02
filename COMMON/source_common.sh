#!/usr/bin/env false

### Inherit $MYCONFIG_ROOT_DIR from parent script
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

### Source 'em:
source $MYCONFIG_ROOT_DIR/COMMON/common_aliases.sh
source $MYCONFIG_ROOT_DIR/COMMON/common_colors.sh
source $MYCONFIG_ROOT_DIR/COMMON/common_env.sh
source $MYCONFIG_ROOT_DIR/COMMON/common_functions.sh
source $MYCONFIG_ROOT_DIR/COMMON/common_iterm2.sh
source $MYCONFIG_ROOT_DIR/COMMON/common_setup_scripts.sh
source $MYCONFIG_ROOT_DIR/COMMON/common_shell_prompt.sh
source $MYCONFIG_ROOT_DIR/COMMON/common_unaliases.sh
