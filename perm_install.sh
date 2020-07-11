#!/usr/bin/env false

###############################################
# Misc variables/Params
###############################################

### Inserts vars for:
### BLA, RED, GRE, YEL, BLU, MAG, CYA, WHI
source /tmp/myconfig/UTILS/color_params.sh

###############################################
# Main Script Logic
###############################################

PREVIOUSDIR=$PWD

clear
echo -e """${CYA}
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


### Finally, source the home-installed myconfig
source $HOME/.myconfig/entry.sh

echo -e """${CYA}
Configurations Installed.

To properly use these configurations, you'll need:

- python3   >=3.4
- tmux      >=2.1
- vim       >=7.4.1578 +clipboard +python3
- powerline

To add bash-it, follow install instructions at:
${WHI}https://github.com/Bash-it/bash-it
${CYA}
If zsh is installed, consider adding ohmyzsh and other tools:

${WHI}https://ohmyz.sh/#install
${WHI}https://github.com/romkatv/powerlevel10k#manual
${WHI}https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
"""

