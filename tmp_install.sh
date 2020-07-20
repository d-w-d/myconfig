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
# Make available fun_bg_install_vundle_plugins
# BLA, RED, GRE, YEL, BLU, MAG, CYA, WHI
###############################################

source /tmp/myconfig/COMMON/common_env.sh
source /tmp/myconfig/COMMON/common_functions.sh

###############################################
# Install Vundle & Plugins
###############################################

VIM_STATUS=""
VIM_STATUS+="${RED}- Vim is not installed! Try installing with: \n"
VIM_STATUS+="${GRE}myconfig_full_installation \n"
VIM_STATUS+="${GRE}myconfig_install_vim${WHI} \n"

### Check that vim is installed
if hash vim >/dev/null 2>&1; then
    fun_bg_install_vundle_plugins

    if [[ $(vim --version | grep -E '\-python3|\-clipboard') ]]; then
        VIM_STATUS=""
        VIM_STATUS+="- Vim is installed BUT does "
        VIM_STATUS+="not have BOTH python3 AND clipboard support; \n"
        VIM_STATUS+="  To install vim with these features, run:\n"
        VIM_STATUS+="${GRE}myconfig_full_installation \n"
        VIM_STATUS+="${GRE}myconfig_install_vim${WHI} \n"
    else
        VIM_STATUS=$(type vim 2>&1)
    fi

    alias vim="vim -N -u /tmp/myconfig/.vimrc"
fi

########################################################
# Provide function to fully install myconfig to home dir
########################################################

myconfig_full_installation() {
    echo 'Running full installation'
    source /tmp/myconfig/perm_install.sh
}
export -f myconfig_full_installation

###############################################

MYCONFIG_ROOT_DIR=/tmp/myconfig source /tmp/myconfig/entry.sh

klear
echo -e """
=======================================
MYCONFIG HAS BEEN TEMPORARILY INSTALLED
=======================================
${GRE}
- Configuration scripts have been cloned to ${WHI}/tmp/myconfig${GRE}

- Bash has sourced ${WHI}/tmp/myconfig/entry.sh${GRE}

$VIM_STATUS

- ${GRE}Run${RED} myconfig_full_installation${GRE} to copy to ${WHI}$HOME/.myconfig
 """
cd $PREVIOUSDIR
