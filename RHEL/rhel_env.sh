#!/usr/bin/env false

##############################################################
### LOAD USEFUL PATHS & ENV VARS
##############################################################

### Augment path for yusr-installed executables
export PATH="$HOME/.yusr/usr/local/sbin:$HOME/.yusr/usr/local/bin:$HOME/.yusr/sbin:$HOME/.yusr/bin:$HOME/.yusr/usr/bin:$HOME/.yusr/usr/bin:$PATH"

### Augment path for yusr-installed libraries
L='/lib:/lib64:/usr/lib:/usr/lib64' && export LD_LIBRARY_PATH="$L:$HOME/.yusr/usr/lib:$HOME/.yusr/usr/lib64"
