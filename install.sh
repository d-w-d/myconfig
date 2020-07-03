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
    echo "Installing myconfig to $HOME/.myconfig"

    ### Copy to ~/.myconfig
    if [[ -d $HOME/.myconfig ]]; then
        echo """
        $HOME/.myconfig already exists. Replace it?
        1. Yes
        2. No
        """
        read -n1 CHOICE
        if [[ $CHOICE == 1 ]]; then
            rm -rf $HOME/.myconfig
            cp -R /tmp/myconfig $HOME/.myconfig
        fi
    else
        cp -R /tmp/myconfig $HOME/.myconfig
    fi

    ### Add sourcing to bashr
    bashOrZsh=${1:-bash}
    MATCHLINE='######### MYCONFIG #########'
    STAMP+='###############################'
    STAMP+='## KEEP THIS BLOCK AS A UNIT ##'
    STAMP+='###############################'
    STAMP+=$MATCHLINE
    STAMP+="source $HOME/.myconfig/entry"
    STAMP+='###############################'
    STAMP+='## KEEP THIS BLOCK AS A UNIT ##'
    STAMP+='###############################'
    echo $STAMP
    echo "... is to be installed"
    if [[ $(grep "$MATCHLINE" $HOME/.bashrc | wc -l) -ge 1 ]]; then

        echo """
        It looks like you're already sourcing myconfig from ~/.${bashOrZsh}rc.
        Would you like to re-insert it?
        1. Yes
        2. No
        """
        read -n1 CHOICE
        if [[ $CHOICE == 1 ]]; then
            echo $STAMP >>$HOME/.{$bashOrZsh}rc
        fi
    else
        echo "Installing to $HOME/.{$bashOrZsh}rc"
        echo $STAMP >>$HOME/.{$bashOrZsh}rc
    fi
    echo "Installation complete"
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
echo "alias vim='vim -N -u /tmp/myconfig/.vimrc'" >>$TEMPFILE
echo "cd $PREVIOUSDIR" >>$TEMPFILE
echo '
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
' >>$TEMPFILE
echo """
    myconfig_full_installation(){
        $(type myconfig_full_installation | sed '1,3d;$d')
    }
""" >>$TEMPFILE
cat $TEMPFILE >temp.txt
MYCONFIG_ROOT_DIR='/tmp/myconfig' bash --rcfile $TEMPFILE

###############################################
# Printout instructions
###############################################
