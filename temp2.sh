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




alias vim='vim -N -u /tmp/myconfig/.vimrc'
cd /Users/dwd

clear
echo -e """\033[32m
Source scripts have been saved to /tmp/myconfig
Bash has sourced /tmp/myconfig/entry.sh
type vim: $(type vim)
\033[37m
"""

echo -e """\033[32m
For full installation of shell configurations:

myconfig_full_installation
\033[37m
"""


    ### Re-declare function
    myconfig_full_installation(){
        ### This will only work from bash shell!
            clear;
    echo -e """$CYA
        Installing myconfig to $HOME/.myconfig...\n\n
    """;
    if [[ -d $HOME/.myconfig ]]; then
        clear;
        echo -e """$CYA
        
        $HOME/.myconfig already exists. Replace it?
        ${RED}1. Yes
        ${GRE}2. No

        """;
        read -n1 CHOICE;
        if [[ $CHOICE == 1 ]]; then
            rm -rf $HOME/.myconfig;
            cp -R /tmp/myconfig $HOME/.myconfig;
            printf "\n\n";
        fi;
    else
        cp -R /tmp/myconfig $HOME/.myconfig;
    fi;
    bashOrZsh=${1:-bash};
    STAMP='\n';
    STAMP+='###############################\n';
    STAMP+='## KEEP THIS BLOCK AS A UNIT ##\n';
    STAMP+='###############################\n';
    MATCHLINE='########## MYCONFIG ##########';
    STAMP+=$MATCHLINE"\n";
    STAMP+='###############################\n';
    STAMP+="source $HOME/.myconfig/entry   \n";
    STAMP+='###############################\n';
    STAMP+='## KEEP THIS BLOCK AS A UNIT ##\n';
    STAMP+='###############################\n';
    if [[ $(grep "$MATCHLINE" $HOME/.${bashOrZsh}rc | wc -l) -ge 1 ]]; then
        echo -e """${CYA}
        It looks like you're already sourcing myconfig from ~/.${bashOrZsh}rc.
        Would you like to re-insert it?
        ${RED}1. Yes
        ${GRE}2. No
        """;
        read -n1 CHOICE;
        if [[ $CHOICE == 1 ]]; then
            printf "$STAMP" >> $HOME/.${bashOrZsh}rc;
        fi;
    else
        echo -e "${CYA}Installing to $HOME/.${bashOrZsh}rc";
        printf "$STAMP" >> $HOME/.${bashOrZsh}rc;
    fi;
    echo -e "${CYA}Installation complete"
    }

