#!/usr/bin/env false

##############################################################
### Create ~/.myfs. This folder -- "my filesystem" -- is the
###  space where utilities in .myconfig can build/copy
###  libraries and executables
##############################################################
[[ ! -d $HOME/.myfs ]] && mkdir $HOME/.myfs && cat >$HOME/.myfs/README.md <<EOL
# What is .myfs?

This is a dir into which processes run from ~/.myconfig can build/copy filesystem executables, libraries, etc.
EOL

##############################################################
### LOAD USEFUL PATHS & ENV VARS
##############################################################

### Augment PATH for executables in ~/.myconfig
export PATH="$HOME/.myconfig/COMMON/.bin:$PATH"

### Augment PATH for executables in ~/.myfs
export PATH="$HOME/.myfs/usr/local/sbin:$HOME/.myfs/usr/local/bin:$HOME/.myfs/sbin:$HOME/.myfs/bin:$HOME/.myfs/usr/bin:$HOME/.myfs/local/bin:$PATH"

### Augment LD_LIBRARY_PATH for myfs-installed libraries
L='/lib:/lib64:/usr/lib:/usr/lib64' && export LD_LIBRARY_PATH="$L:$HOME/.myfs/usr/lib:$HOME/.myfs/usr/lib64"

### iTerm2 Utilities
###   To create ~/.iterm2 dir, you need to run `iterm2 > Install Shell Integration` with
###   `Also install iTerm2 Utilities` checked
export PATH="$HOME/.iterm2:$PATH"

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

### Makes bash history unlimied
#HISTSIZE=
#HISTFILESIZE=
