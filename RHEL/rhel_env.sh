#!/usr/bin/env false

##############################################################
### LOAD USEFUL PATHS & ENV VARS
##############################################################

### Create .myfs/rpm dir for use with yusr executable
[[ ! -d $HOME/.myfs ]] && mkdir -p $HOME/.myfs/rpm

### Augment path for yusr-installed libraries
L='/lib:/lib64:/usr/lib:/usr/lib64' && export LD_LIBRARY_PATH="$L:$HOME/.myfs/usr/lib:$HOME/.myfs/usr/lib64"
