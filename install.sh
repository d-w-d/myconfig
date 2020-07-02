#!/usr/bin/env false

###############################################
# Define variables/Params
###############################################

TERM=ansi

###############################################
# Define helper functions
###############################################

function abort_install() {
    # Provide message as to why we're aboritng install
    if [[ $1 ]]; then
        echo $1
    else
        echo "Aborting install for unspecified reason"
    fi
    exit 1
}

function myconfig_full_installation() {
    echo "Full installation place holder"

}

###############################################
# Check for required executables
###############################################

# Require GIT
command -v git >/dev/null 2>&1 || abort_install "Git is not installed. Aborting installation."

###############################################
# Begin Main Script Logic
###############################################

PREVIOUSDIR=$PWD
if [[ -d /tmp/myconfig ]]; then
    echo "Updating git repo for myconfig..."
    cd /tmp/myconfig
    git fetch origin
    git checkout master
    git reset --hard origin/master
else
    echo "Cloning git repo for myconfig..."
    cd /tmp
    git clone https://github.com/dan-drago/myconfig.git
    cd myconfig
fi

### Install VIM and plugins quietly in background
[ ! -d ~/.vim/bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim >/dev/null 2>&1 && vim -N -u $PWD/.vimrc +PluginInstall +qall >/dev/null 2>&1 &

### Create bashrc file and start new shell
TEMPFILE=$(mktemp)
cat /tmp/myconfig/entry.sh >$TEMPFILE
echo "alias vim='vim -u /tmp/myconfig/.vimrc'" >>$TEMPFILE
echo "cd $PREVIOUSDIR" >>$TEMPFILE
echo '
clear
echo -e """\033[32m 
Source scripts have been saved to /tmp/myconfig
Bash has sourced /tmp/myconfig/entry.sh
Vim is aliased to 'vim -u /tmp/myconfig/.vimrc'
\033[37m
"""

echo -e """\033[32m 
For full installation of shell configurations:

myconfig_install_bash
\033[37m
"""
' >>$TEMPFILE
MYCONFIG_ROOT_DIR='/tmp/myconfig' bash --rcfile $TEMPFILE

###############################################
# Printout instructions
###############################################


