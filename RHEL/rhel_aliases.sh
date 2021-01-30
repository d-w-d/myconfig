#!/usr/bin/env false

### Inherit $MYCONFIG_ROOT_DIR from parent script
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

####################################################
# RHEL Aliases
####################################################

alias ls='ls -F --color'        # Sort with color and file-type indicator
alias allsblk="lsblk -o name,fstype,size,mountpoint,partuuid"
alias alportsinuse='sudo netstat -tulpn'
alias alwwwhtml='cd /var/www/html'


