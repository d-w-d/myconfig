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

###############################################
# Check for required executables
###############################################

# Require GIT
command -v git >/dev/null 2>&1 || abort_install "Git is not installed. Aborting installation."

###############################################
# Begin Main Script Logic
###############################################

PREVIOUSDIR=$PWD
cd /tmp
[ -d /tmp/myconfig ] && rm -rf myconfig
git clone https://github.com/dan-drago/myconfig.git
cd $PREVIOUSDIR

echo "Source scripts have been saved to /tmp/myconfig. Run \`mybash\` to source bash shell"
alias mybash='bash --rcfile /tmp/myconfig/entry'

clear
echo -e """
\033[33m
This is a message in color
\033[31m
"""
