#!/usr/bin/env false
#
# Library to expose myconfig tools to current shell

### Variables to be cleaned up at end
is_verbose=false

### Inherit $MYCONFIG_ROOT_DIR from parent script, else use default location
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

### Ohmyzsh instaprompt requires no console I/O
[[ $ZSH_VERSION ]] && is_verbose=false

### Source config files common to all OSes
source $MYCONFIG_ROOT_DIR/COMMON/source_common.sh

### Determine OS type
OS=""
if [[ $(uname -s) == Darwin ]]; then OS="MACOS"; fi

if [[ $(uname -s) == Linux ]]; then
    if [[ $(cat /etc/os-release | grep -Ei "ID_LIKE(.*)rhel" | wc -l) -eq 1 ]]; then
        OS="RHEL"
    fi
    if [[ $(cat /etc/os-release | grep -Ei "ID_LIKE(.*)debian" | wc -l) -eq 1 ]]; then
        OS="DEBIAN"
    fi
fi

### Source further config files based on OS type
case "$OS" in
MACOS)
    source $MYCONFIG_ROOT_DIR/MACOS/source_macos.sh
    $is_verbose && echo "Shell set up for MACOS"
    ;;
DEBIAN)
    source $MYCONFIG_ROOT_DIR/DEBIAN/source_debian.sh
    $is_verbose && echo "Shell set up for Debian"
    ;;
RHEL)
    source $MYCONFIG_ROOT_DIR/RHEL/source_rhel.sh
    $is_verbose && echo "Shell set up for RHEL"
    ;;
*)
    $is_verbose && echo "Source failed to identify this OS. Only 'Common' shell settings applied."
    ;;
esac

### Source settings specific to this machine in $MYCONFIG_ROOT_DIR/misc.sh
[[ ! -f $MYCONFIG_ROOT_DIR/misc.sh ]] &&
    touch $MYCONFIG_ROOT_DIR/misc.sh &&
    echo "#!/usr/bin/env false" >>$MYCONFIG_ROOT_DIR/misc.sh
source $MYCONFIG_ROOT_DIR/misc.sh




