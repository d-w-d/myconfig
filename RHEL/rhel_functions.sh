#!/usr/bin/env bash
#
# Functions to only be defined on Centos/RHEL machines

MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

########################################################
# Completes installation of YouCompleteMe Vundle Plugin.
#   Needed because ycm needs cmake for installation,
#   and this may not be available on your machine.
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Eventually writes message to stdout stating
#   that the installation is complete
########################################################
fun_complete_ycm_installation() {

    ### Confirm prereqs
    [[ ! -d $HOME/.vim/bundle ]] && echo "$HOME/.vim/bundle not found" && return 1
    hash python3 >/dev/null 2>&1 || (echo "python3 not found" && return 1)
    hash pip3 >/dev/null 2>&1 || (echo "pip3 not found" && return 1)

    echo "Completing installation of YouCompleteMe..."
    ((TEMP=$(PREVIOUSDIR=$PWD;
    cd $HOME/.vim/bundle/YouCompleteMe;
    git pull origin master
    git submodule update --init --recursive;
    python3 -m pip install --user cmake;
    python3 install.py --all;
    echo -e "echo '''\033[31m
    ====================================
    YouCompleteMe Installation Finalized
    ====================================\n\033[37m''';
    "; cd $PREVIOUSDIR); bash -c "$TEMP" ) &)

    return 0
}

[ $BASH ] && export -f fun_complete_ycm_installation


