#!/usr/bin/env bash
#
# Functions to only be defined on Centos/RHEL machines

MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

#####################################################
# Function to build full-featured vim from source
# and install to ~/.myfs
#####################################################
function fun_install_vim() {

    PREVIOUSDIR=$PWD
    ### Build recent ncurses
    #cd /tmp
    #curl -o ncurses.tar.gz http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
    #tar -xzvf ncurses.tar.gz
    #cd ncurses-6.2
    #./configure --prefix=$HOME/.myfs/usr/local
    #make
    #make install

    ### Build recent tmux 3.1b
    cd /tmp
    git clone https://github.com/vim/vim.git
    cd vim/src

    make distclean
    BEGINCONFIG=true \
        CFLAGS="-I$HOME/.myfs/usr/local/include" \
        LDFLAGS="-L$HOME/.myfs/usr/local/lib" ./configure \
        --with-x \
        --enable-gui=auto \
        --enable-gui="auto" \
        --enable-pythoninterp="yes" \
        --with-python-config-dir="/usr/lib64/python2.7/config" \
        --enable-python3interp="yes" \
        --enable-gtk2-check \
        --with-python3-config-dir="/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu" \
        --enable-fail-if-missing \
        --prefix="$HOME/.myfs/usr/local"
    make
    make install

    cd $PREVIOUSDIR

    ### Now that vim is installed, let's download vundle plugins
    source $MYCONFIG_ROOT_DIR/COMMON/common_functions.sh
    fun_bg_install_vundle_plugins

}
