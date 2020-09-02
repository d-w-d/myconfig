#!/usr/bin/env bash
#
# Functions to only be defined on Centos/RHEL machines

MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

#################################################
# Install Vundle Plugins as background process;
#   also installs cmake and YCM via call to separate function
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Eventually writes message to stdout stating
#   that the installation is complete
#################################################
fun_bg_install_vundle_plugins() {

    ### Confirm some prereqs
    [[ ! -d /tmp/myconfig ]] && echo "/tmp/myconfig not found" && return 1
    hash vim >/dev/null 2>&1 || (echo "vim not found" && return 1)

    ### Clone/update vundle repo
    if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
        # If Vundle not installed then clone it
        git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    else
        # If Vundle dir exists, update it
        cd $HOME/.vim/bundle/Vundle.vim
        git fetch origin
        git checkout master
        git reset --hard origin/master
    fi

    ### Install vundle plugins as bg process then print message
    ### If cmake is absent, then also complete ycm installtion
    echo "Installing vundle plugins..."
    ((TEMP=$(vim -E -N -u /tmp/myconfig/.vimrc +PluginInstall +qall;
    echo -e "echo '''\033[31m
    ================================================
    VUNDLE PLUGINS HAVE FINISHED INSTALLING/UPDATING
    ================================================\n\033[37m''';";
    hash cmake >/dev/null 2>&1 || fun_complete_ycm_installation  >/dev/null 2>&1;
    ); bash -c "$TEMP" ) &)
    return 0
}

[ $BASH ] && export -f fun_bg_install_vundle_plugins

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


