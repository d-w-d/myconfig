#!/usr/bin/env false

### Inherit $MYCONFIG_ROOT_DIR from parent script
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

### Augment PATH for executables in ~/.myconfig
export PATH="$HOME/.myconfig/DEBIAN/.bin:$PATH"
