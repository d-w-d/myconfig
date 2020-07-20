#!/usr/bin/env false

###############################################
# Make available fun_bg_install_vundle_plugins
###############################################
source /tmp/myconfig/COMMON/common_env.sh
source /tmp/myconfig/COMMON/common_functions.sh

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
hash git >/dev/null 2>&1 || abort_install "Git is not installed. Aborting installation."

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

hash git >/dev/null 2>&1 || abort_install "git not installed"

### Check that vim is installed
if hash vim >/dev/null 2>&1; then

    fun_bg_install_vundle_plugins

else
    echo -e """${RED}
    VIM isn't available.
    ${WHI}
    """
    if [[ "$OS" == "RHEL" ]]; then
        echo "Try installing vim with yusr."
    fi
fi

myconfig_full_installation() {
    echo 'Running full installation'
    source /tmp/myconfig/perm_install.sh
}
export -f myconfig_full_installation

###############################################
# Create temp bashrc amalgum file and source it
###############################################

TEMPFILE=$(mktemp)
cat /tmp/myconfig/entry.sh >$TEMPFILE
echo "alias vim='vim -N -u /tmp/myconfig/.vimrc'" >>$TEMPFILE
echo "source /tmp/myconfig/UTILS/color_params.sh" >>$TEMPFILE

#echo "
#myconfig_full_installation(){
    #echo 'Running full installation'
    #source /tmp/myconfig/perm_install.sh
#}
#export -f myconfig_full_installation
#" >>$TEMPFILE

echo "
echo -e '${CYA}
===================
MYCONFIG DOWNLOADED
===================
${GRE}
- Configuration scripts have been cloned to ${WHI}/tmp/myconfig${GRE}

- Bash has sourced ${WHI}/tmp/myconfig/entry.sh${GRE}

- Vim status: ${WHI}$(type vim 2>&1)${GRE}

- Run${RED} myconfig_full_installation${GRE} for full install.

'
" >>$TEMPFILE
cat $TEMPFILE >temp.sh

### Source temp bashrc file
MYCONFIG_ROOT_DIR='/tmp/myconfig' source $TEMPFILE

### Return to original dir
cd $PREVIOUSDIR
