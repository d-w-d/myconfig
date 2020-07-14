#!/usr/bin/env bash
#
# Functions to only be defined on Centos/RHEL machines

#####################################################
# Function to build full-featured vim from source
# and install to ~/.yusr
#####################################################
function fun_install_vim() {

    PREVIOUSDIR=$PWD
    ### Build recent ncurses
    #cd /tmp
    #curl -o ncurses.tar.gz http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
    #tar -xzvf ncurses.tar.gz
    #cd ncurses-6.2
    #./configure --prefix=$HOME/.yusr/usr/local
    #make
    #make install

    ### Build recent tmux 3.1b
    cd /tmp
    git clone https://github.com/vim/vim.git
    cd vim/src

    BEGINCONFIG=true \
        CFLAGS="-I$HOME/.yusr/usr/local/include" \
        LDFLAGS="-L$HOME/.yusr/usr/local/lib" configure \
        --with-x \
        --enable-gui=auto \
        --enable-gui="auto" \
        --enable-pythoninterp="yes" \
        --with-python-config-dir="/usr/lib64/python2.7/config" \
        --enable-python3interp="yes" \
        --enable-gtk2-check \
        --with-python3-config-dir="/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu" \
        --enable-fail-if-missing \
        --prefix="$HOME/.yusr/usr/local"
    make
    make install

    cd $PREVIOUSDIR
}
