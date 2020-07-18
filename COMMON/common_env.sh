#!/usr/bin/env false

##############################################################
### LOAD USEFUL PATHS & ENV VARS
##############################################################

### Create ~/.myfs
### This folder -- "my filesystem" -- is the space where executables in .myconfig
### can build/copy libraries and executables using e.g. the yusr script on RHEL/centos
[[ ! -d $HOME/.myfs ]] && mkdir $HOME/.myfs && cat >$HOME/.myfs/README.ms <<EOL
# What is .myfs?

This is a dir into which processes run from ~/.myconfig can build/copy filesystem executables, libraries, etc.
EOL

### Augment PATH for executables in ~/.myfs
export PATH="$HOME/.myfs/usr/local/sbin:$HOME/.myfs/usr/local/bin:$HOME/.myfs/sbin:$HOME/.myfs/bin:$HOME/.myfs/usr/bin:$HOME/.myfs/usr/bin:$PATH"

### iTerm2 Utilities
###   To create ~/.iterm2 dir, you need to run `iterm2 > Install Shell Integration` with
###   `Also install iTerm2 Utilities` checked
export PATH="$HOME/.iterm2:$PATH"

### Set up goLang Paths; see: https://stackoverflow.com/a/10847122
export GOPATH=$HOME/work/goProgramming:$HOME/work/goProgramming/bin
export GOROOT=$HOME/work/goProgramming
export PATH=$PATH:$GOROOT/bin

### Python User-installed executables
export PATH="$HOME/.local/bin:$PATH"

### HOMEBREW-GDL RECOMMENDED
# "If you need to have icu4c first in your PATH run:"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# For compilers to find icu4c you may need to set:
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# For pkg-config to find icu4c you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

### Create shortcuts for color switching
### BLA, RED, GRE, YEL, BLU, MAG, CYA, WHI
export BLA="\033[30m"
export RED="\033[31m"
export GRE="\033[32m"
export YEL="\033[33m"
export BLU="\033[34m"
export MAG="\033[35m"
export CYA="\033[36m"
export WHI="\033[37m"
