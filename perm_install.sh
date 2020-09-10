#!/usr/bin/env false

###############################################
# Misc variables/Params
###############################################

### Inserts vars for:
### BLA, RED, GRE, YEL, BLU, MAG, CYA, WHI
if [[ $HOME/.myconfig/UTILS/color_params.sh ]]; then
    source $HOME/.myconfig/UTILS/color_params.sh
else
    source /tmp/myconfig/UTILS/color_params.sh
fi

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

### Add bash configuration
CREATE_SYMLINK=true
if [[ ! $1 && -f $HOME/.bashrc && ! -L $HOME/.bashrc ]]; then
    ### Prompt user to replace file with symlink
    echo -e """${CYA}
        A non-symbolic link already exists at $PWD/.bashrc.
        Replace it with link to ${WHI}~/.myconfig/.bashrc${CYA}?

        ${RED}1. Yes
        ${GRE}2. No
    """
    read CHOICE
    [[ $CHOICE == 1 ]] && CREATE_SYMLINK=false
fi
if [[ $CREATE_SYMLINK ]]; then
    ### Make sure the symlink points to .myconfig/.bashrc
    rm $HOME/.bashrc
    ln -s $HOME/.myconfig/.bashrc $HOME/.bashrc
fi

### Add tmux configuration
CREATE_SYMLINK=true
if [[ ! $1 && -f $HOME/.tmux.conf && ! -L $HOME/.tmux.conf ]]; then
    ### Prompt user to replace file with symlink
    echo -e """${CYA}
        A non-symbolic link already exists at $PWD/.tmux.conf.
        Replace it with link to ${WHI}~/.myconfig/.tmux.conf${CYA}?

        ${RED}1. Yes
        ${GRE}2. No
    """
    read CHOICE
    [[ $CHOICE == 1 ]] && CREATE_SYMLINK=false
fi
if [[ $CREATE_SYMLINK ]]; then
    ### Make sure the symlink points to .myconfig/.tmux.conf
    rm $HOME/.tmux.conf
    ln -s $HOME/.myconfig/.tmux.conf $HOME/.tmux.conf
fi

### Add vimrc configuration
CREATE_SYMLINK=true
if [[ ! $1 && -f $HOME/.vimrc && ! -L $HOME/.vimrc ]]; then
    ### Prompt user to replace file with symlink
    echo -e """${CYA}
        A non-symbolic link already exists at $PWD/.vimrc.
        Replace it with link to ${WHI}~/.myconfig/.vimrc${CYA}?

        ${RED}1. Yes
        ${GRE}2. No
    """
    read CHOICE
    [[ $CHOICE == 1 ]] && CREATE_SYMLINK=false
fi
if [[ $CREATE_SYMLINK ]]; then
    ### Make sure the symlink points to .myconfig/.vimrc
    rm $HOME/.vimrc
    ln -s $HOME/.myconfig/.vimrc $HOME/.vimrc
fi

### Add zshrc configuration
CREATE_SYMLINK=true
if [[ ! $1 && -f $HOME/.zshrc && ! -L $HOME/.zshrc ]]; then
    ### Prompt user to replace file with symlink
    echo -e """${CYA}
        A non-symbolic link already exists at $PWD/.zshrc.
        Replace it with link to ${WHI}~/.myconfig/.zshrc${CYA}?

        ${RED}1. Yes
        ${GRE}2. No
    """
    read CHOICE
    [[ $CHOICE == 1 ]] && CREATE_SYMLINK=false
fi
if [[ $CREATE_SYMLINK ]]; then
    ### Make sure the symlink points to .myconfig/.zshrc
    rm $HOME/.zshrc
    ln -s $HOME/.myconfig/.zshrc $HOME/.zshrc
fi

### Add p10k configuration
CREATE_SYMLINK=true
if [[ ! $1 && -f $HOME/.p10k.zsh && ! -L $HOME/.p10k.zsh ]]; then
    ### Prompt user to replace file with symlink
    echo -e """${CYA}
        A non-symbolic link already exists at $PWD/.p10k.zsh
        Replace it with link to ${WHI}~/.myconfig/.p10k.zsh${CYA}?

        ${RED}1. Yes
        ${GRE}2. No
    """
    read CHOICE
    [[ $CHOICE == 1 ]] && CREATE_SYMLINK=false
fi
if [[ $CREATE_SYMLINK ]]; then
    ### Make sure the symlink points to .myconfig/.zshrc
    rm $HOME/.p10k.zsh
    ln -s $HOME/.myconfig/.p10k.zsh $HOME/.p10k.zsh
fi

### Finally, source the home-installed myconfig
unalias vim
source $HOME/.myconfig/entry.sh

echo -e """${CYA}
Configurations Installed.

To properly use these configurations, you'll need:

- python3   >=3.4
- tmux      >=2.1
- vim       >=7.4.1578 +clipboard +python3

To add bash-it, follow install instructions at:
${WHI}https://github.com/Bash-it/bash-it
${CYA}

If zsh is installed, consider adding ohmyzsh and other tools:

${WHI}https://ohmyz.sh/#install
${WHI}https://github.com/romkatv/powerlevel10k#manual
${WHI}https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
${WHI}https://github.com/lukechilds/zsh-nvm#as-an-oh-my-zsh-custom-plugin
"""
