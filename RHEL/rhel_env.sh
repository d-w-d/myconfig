#!/usr/bin/env false

##############################################################
### LOAD USEFUL PATHS & ENV VARS
##############################################################

### Path for yusr-installed executables
[[ -d $HOME/.yusr ]] && export PATH="$HOME/.yusr/sbin:$HOME/.yusr/bin:$HOME/.yusr/usr/bin:$HOME/.yusr/usr/bin:$PATH"


[[ -d $HOME/.yusr ]] && L='/lib:/lib64:/usr/lib:/usr/lib64' && export LD_LIBRARY_PATH="$L:$HOME/.yusr/usr/lib:$HOME/.yusr/usr/lib64"
