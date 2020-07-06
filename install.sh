#!/usr/bin/env false

###############################################
# Define variables/Params
###############################################

TERM=ansi
export BLA="\033[30m"
export RED="\033[31m"
export GRE="\033[32m"
export YEL="\033[33m"
export BLU="\033[34m"
export MAG="\033[35m"
export CYA="\033[36m"
export WHI="\033[37m"
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

    PREVIOUSDIR=$PWD

    clear
    echo -e """$CYA
    Installing myconfig to $HOME/.myconfig...\n\n
    """

    ### Copy to or update ~/.myconfig
    if [[ -d $HOME/.myconfig ]]; then
        cd $HOME/.myconfig
        git fetch origin
        git checkout master
        git reset --hard origin/master
        cd $PREVIOUSDIR
    else
        cp -R /tmp/myconfig $HOME/.myconfig
    fi

    ### Add sourcing to bashrc
    bashOrZsh=${1:-bash}
    STAMP='\n'
    STAMP+='###############################\n'
    MATCHLINE='########## MYCONFIG ##########'
    STAMP+=$MATCHLINE"\n"
    STAMP+='###############################\n'
    STAMP+="export MYCONFIG_ROOT_DIR=$HOME/.myconfig"
    STAMP+="\n"
    STAMP+="source $HOME/.myconfig/entry.sh \n"
    STAMP+='###############################\n'
    if [[ $(grep "$MATCHLINE" $HOME/.${bashOrZsh}rc | wc -l) -ge 1 ]]; then

        echo -e """${CYA}
        It looks like you're already sourcing myconfig from ~/.${bashOrZsh}rc.
        Would you like to re-insert it?
        ${RED}1. Yes
        ${GRE}2. No
        """
        read -n1 CHOICE
        if [[ $CHOICE == 1 ]]; then
            printf "$STAMP" >>$HOME/.${bashOrZsh}rc
        fi
    else
        printf "$STAMP" >>$HOME/.${bashOrZsh}rc
    fi

    ### Add tmux configuration
    if [[ -f $HOME/.tmux.conf ]]; then
        echo -e """${CYA}
        .tmux.conf exists already. Replace it?

        ${RED}1. Yes
        ${GRE}2. No
        """
        read -n1 CHOICE
        if [[ $CHOICE == 1 ]]; then
            echo ""
            cp /tmp/myconfig/.tmux.conf $HOME/.tmux.conf
        fi
    else
        cp /tmp/myconfig/.tmux.conf $HOME/.tmux.conf
    fi

    ### Add vimrc configuration
    if [[ -f $HOME/.vimrc ]]; then
        echo -e """${CYA}
        .vimrc exists already. Replace it?

        ${RED}1. Yes
        ${GRE}2. No
        """
        read -n1 CHOICE
        if [[ $CHOICE == 1 ]]; then
            echo ""
            cp /tmp/myconfig/.vimrc $HOME/.vimrc
        fi
    else
        cp /tmp/myconfig/.vimrc $HOME/.vimrc
    fi

    echo -e """${CYA}
    Installation complete.

    To add bash-it, follow install instructions at:
    ${WHI}https://github.com/Bash-it/bash-it
    ${CYA}
    To use the zshell, install ohmyzsh followed by powerlevel10k:

    ${WHI}https://ohmyz.sh/#install
    ${WHI}https://github.com/romkatv/powerlevel10k#manual
    """
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
    echo -e "${CYA}Updating git repo for myconfig..."
    cd /tmp/myconfig
    git fetch origin
    git checkout master
    git reset --hard origin/master
else
    echo -e "${CYA}Cloning git repo for myconfig..."
    cd /tmp
    git clone https://github.com/dan-drago/myconfig.git
    cd myconfig
fi

### Install VIM and plugins quietly in background
if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
    # If Vundle not installed, clone then install plugins
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim >/dev/null 2>&1 && vim -N -u /tmp/myconfig/.vimrc +PluginInstall +qall >/dev/null 2>&1 &
else
    # Install all vundle plugins
    vim -N -u /tmp/myconfig/.vimrc +PluginInstall +qall >/dev/null 2>&1 &
fi

### Create bashrc file and start new shell
TEMPFILE=$(mktemp)
cat /tmp/myconfig/entry.sh >$TEMPFILE
echo "alias vim='vim -N -u /tmp/myconfig/.vimrc'" >>$TEMPFILE
echo "cd $PREVIOUSDIR" >>$TEMPFILE
echo '
echo -e """\033[37m
=================
DOWNLOAD COMPLETE
=================
\033[32m
Configuration scripts have been cloned to /tmp/myconfig

Bash has sourced /tmp/myconfig/entry.sh

type vim: $(type vim)

\033[31m
Run\033[37m myconfig_full_installation\033[31m for full install.
\033[37m
"""
' >>$TEMPFILE
echo """
### Re-declare function
myconfig_full_installation(){
    ### This will only work from bash shell!
    $(type myconfig_full_installation | sed '1,3d;$d')
}
""" >>$TEMPFILE
cat $TEMPFILE >temp2.sh
MYCONFIG_ROOT_DIR='/tmp/myconfig' bash --rcfile $TEMPFILE

###############################################
# Printout instructions
###############################################
