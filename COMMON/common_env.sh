#!/usr/bin/env false

### Inherit $MYCONFIG_ROOT_DIR from parent script
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

### Augment PATH for executables in ~/.myfs
[[ -d $HOME/.myfs ]] && export PATH="$HOME/.myfs/usr/local/sbin:$HOME/.myfs/usr/local/bin:$HOME/.myfs/sbin:$HOME/.myfs/bin:$HOME/.myfs/usr/bin:$HOME/.myfs/local/bin:$PATH"

### Augment PATH for executables in ~/.myconfig
export PATH="$MYCONFIG_ROOT_DIR:$MYCONFIG_ROOT_DIR/COMMON/.bin:$PATH"

### Augment LD_LIBRARY_PATH for myfs-installed libraries
L='/lib:/lib64:/usr/lib:/usr/lib64' && export LD_LIBRARY_PATH="$L:$HOME/.myfs/usr/lib:$HOME/.myfs/usr/lib64"

### Python User-installed executables
export PATH="$HOME/.local/bin:$PATH"

### HOMEBREW-GDL RECOMMENDED
# "If you need to have icu4c first in your PATH run:"
# export PATH="/usr/local/opt/icu4c/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# For compilers to find icu4c you may need to set:
# export LDFLAGS="-L/usr/local/opt/icu4c/lib"
# export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# For pkg-config to find icu4c you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

### Make vim the default editor:
export VISUAL=vim
export EDITOR=vim
