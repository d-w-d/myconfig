#!/usr/bin/env false

###############################################
# Define pre-git-cloning helper functions
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

###############################################
# Check for required executables
###############################################

# Require GIT
command -v git >/dev/null 2>&1 || abort_install "Git is not installed. Aborting installation."

###################################################
# Clone/Update myconfig Repo
# (Do this early so we can source other scripts)
###################################################

PREVIOUSDIR=$PWD

if [[ -d /tmp/myconfig ]]; then
    echo -e "Updating git repo for myconfig..."
    cd /tmp/myconfig
    git fetch origin
    git checkout master
    git reset --hard origin/master
else
    echo -e "Cloning git repo for myconfig..."
    cd /tmp
    git clone https://github.com/dan-drago/myconfig.git
    cd myconfig
    touch misc.sh
fi


###############################################
# Misc variables/Params
###############################################

### Inserts vars for:
### BLA, RED, GRE, YEL, BLU, MAG, CYA, WHI
source /tmp/myconfig/UTILS/color_params.sh


###############################################
# Install Vundle & Plugins
###############################################

### Clone/update vundle
if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
    # If Vundle not installed, clone then install plugins
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
    # Install all vundle plugins
    cd $HOME/.vim/bundle/Vundle.vim
    git fetch origin
    git checkout master
    git reset --hard origin/master
fi

# Install Vundle plugins as background process and print message when done
TOPSHELLPID=$$
((TEMP=$(vim -E -N -u /tmp/myconfig/.vimrc +PluginInstall +qall; echo -e "kill -INT $TOPSHELLPID; echo '''\033[31m
================================================
VUNDLE PLUGINS HAVE FINISHED INSTALLING/UPDATING
================================================\033[37m''';
"); bash -c "$TEMP" ) &)

###############################################
# Create temp bashrc amalgum file and source it
###############################################

TEMPFILE=$(mktemp)
cat /tmp/myconfig/entry.sh >$TEMPFILE
echo "alias vim='vim -N -u /tmp/myconfig/.vimrc'" >>$TEMPFILE
echo "source /tmp/myconfig/UTILS/color_params.sh" >>$TEMPFILE
echo "
myconfig_full_installation(){
    # Start is new shell to avoid interruption by vundle messaging
    echo 'Running full installation'
    bash --rcfile /tmp/myconfig/perm_install.sh
}
" >>$TEMPFILE
echo "
    echo -e '${CYA}
    ===================
    MYCONFIG DOWNLOADED
    ===================
    ${GRE}
    - Configuration scripts have been cloned to ${WHI}/tmp/myconfig${GRE}

    - Bash has sourced ${WHI}/tmp/myconfig/entry.sh${GRE}

    - Vim status: ${WHI}$(type vim)${GRE}

    - Vundle plugins are being downloaded. Will notify in this shell when ready.

    - Run${RED} myconfig_full_installation${GRE} for full install.

    '
" >>$TEMPFILE
cat $TEMPFILE >temp.sh

### Source temp bashrc file
MYCONFIG_ROOT_DIR='/tmp/myconfig' source $TEMPFILE

### Return to original dir
cd $PREVIOUSDIR
