#!/usr/bin/env false

##############################################################
### LOAD USEFUL PATHS & ENV VARS
##############################################################

### Augment PATH for executables in ~/.myconfig
export PATH="$HOME/.myconfig/MACOS/.bin:$PATH"

### HOMEBREW PATHS
export PATH="/usr/local/sbin:$PATH"

### ADD BINUTILS (e.g. readelf); we add to end of PATH since we don't want
### to short cut MACOS system commands
export PATH="$PATH:/usr/local/opt/binutils/bin"

### Set up goProgramming Paths; see: https://stackoverflow.com/a/10847122
export GOPATH=$HOME/work/goProgramming:$HOME/work/goProgramming/bin
export GOROOT=$HOME/work/goProgramming
export PATH=$PATH:$GOROOT/bin

### JAVA
export M2_HOME=$HOME/work/Java/_apache-maven-3.5.4
export PATH=$PATH:$HOME/work/Java/_apache-maven-3.5.4/bin

### PHP Attempt
export PATH=$PATH:$HOME/.composer/vendor/bin

### PYTHON

### HOMEBREW-GDL RECOMMENDED
# "If you need to have icu4c first in your PATH run:"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# For compilers to find icu4c you may need to set:
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# For pkg-config to find icu4c you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
