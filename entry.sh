#!/usr/bin/env false

##############################################################
### Inherit $MYCONFIG_ROOT_DIR from parent script
##############################################################
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

##############################################
# Logic to determine OS type
##############################################

OS=""
if [[ $(uname -s) == Darwin ]]; then OS="MACOS"; fi

if [[ $(uname -s) == Linux ]]; then
  if [[ $(cat /etc/os-release | grep -E "ID_LIKE(.*)rhel" | wc -l) == 1 ]]; then
    OS="RHEL"
  fi
  if [[ $(cat /etc/os-release | grep -Ei "ID_LIKE(.*)debian" | wc -l) == 1 ]]; then
    OS="DEBIAN"
  fi
fi

##################################################
# Source config files common to all OSes
##################################################
source $MYCONFIG_ROOT_DIR/COMMON/source_common.sh

##################################################
# Source config files based on OS type
##################################################

clear

case "$OS" in
MACOS)
  echo "Shell set up for MACOS"
  source $MYCONFIG_ROOT_DIR/MACOS/source_macos.sh
  ;;
DEBIAN)
  echo "Shell set up for Debian"
  source $MYCONFIG_ROOT_DIR/DEBIAN/source_debian.sh
  ;;
RHEL)
  echo "Shell set up for RHEL"
  source $MYCONFIG_ROOT_DIR/RHEL/source_rhel.sh
  ;;
*)
  echo "Source failed to identify this OS. Only 'Common' shell settings applied."
  ;;
esac

##################################################
# Source settings specific to this machine
##################################################

[ -f $MYCONFIG_ROOT_DIR/misc.sh ] && source $MYCONFIG_ROOT_DIR/misc.sh




