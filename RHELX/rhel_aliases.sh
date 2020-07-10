#!/usr/bin/env false

##############################################################
### Inherit $MYCONFIG_ROOT_DIR from parent script
##############################################################
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

####################################################
# RHEL Aliases
####################################################
alias allsblk="lsblk -o name,fstype,size,mountpoint,partuuid"
alias alportsinuse='sudo netstat -tulpn'
alias alwwwhtml='cd /var/www/html'


### Make yusr tool available as exe-like
alias yusr="$MYCONFIG_ROOT_DIR/RHEL/_yusr.sh"
