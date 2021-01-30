#!/usr/bin/env false
#
# Define functions useful across all *NIX platforms

#################################################
# Function to fully install myconfig to home dir
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Writes message to stdout
#################################################
#myconfig_full_installation() {
    #[[ $(fun_which_os) == "MACOS" ]] && echo "Don't run this on MacOS!" && return 1
    #echo 'Running full installation'
    #### Prefer to source from HOME to avoid having to redownload to tmp
    #if [[ -f $HOME/.myconfig/perm_install.sh ]]; then
        #source $HOME/.myconfig/perm_install.sh
    #else
        #source /tmp/myconfig/perm_install.sh
    #fi
#}

#[ $BASH ] && export -f myconfig_full_installation

#################################################
# Returns data type regardless of bash or zsh
# Globals:
#   None
# Arguments:
#  Target data structure
# Outputs:
#   Writes type of file to stdout
#################################################
function fun_data_type {

    ### Ensure an argument is given pointing to the target data structure
    [ -z $1 ] && echo "fun_data_type needs an argument!" && return 1

    ### Echo result based on active shell
    if [ $BASH ]; then
        echo $(type -t $1)
    elif [ $ZSH_VERSION ]; then
        echo whence -w $1 | cut -f2 -d ' '
    else
        echo "fun_data_type is only to be run from a bash/zsh" && return 1
    fi
    return 0
}

#################################################
# Determines operating system of present machine
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Writes content of $OS to stdout
#################################################
function fun_which_os {
    OS="UNKNOWN"
    if [[ $(uname -s) == Darwin ]]; then OS="MACOS"; fi

    if [[ $(uname -s) == Linux ]]; then
        if [[ $(cat /etc/os-release | grep -E "ID_LIKE(.*)rhel" | wc -l) == 1 ]]; then
            OS="RHEL"
        fi
        if [[ $(cat /etc/os-release | grep -Ei "ID_LIKE(.*)debian" | wc -l) == 1 ]]; then
            OS="DEBIAN"
        fi
    fi
    echo $OS
    return 0
}

[ $BASH ] && export -f fun_which_os

