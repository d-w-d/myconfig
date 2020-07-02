#!/usr/bin/env false

##############################################################
### Inherit $MYCONFIG_ROOT_DIR from parent script
##############################################################
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

##############################################################
# Modify 'ls' family (this assumes you use a recent GNU ls).
##############################################################

alias ls='ls -GF'               # Sort with color and file-type indicator
alias lsDirsOnly='ls -d'        # List just dir names (not their content).
alias lsSortBySize='ls -Sr'     # Sort by size, biggest last
alias lt='ls -ltr'              # Sort by date, most recent last.

##############################################################
# Useful Aliases for All *NIX Environments
##############################################################

alias alcatcolored='highlight -O ansi --force'
alias alhttpserver='http-server'
alias alimgcat='~/.local/bin/imgcat --height 10' # For imgcat installed with
                                                 # `pip3 install --user imgcat`
alias alipaddress="curl http://ipecho.net/plain; echo"
alias aljs='cd ~/work/javascript'
alias allocaltunnel='lt' ### Use e.g. --port 8080
alias alnpmconfigsetignorescripts="printf '\n\n This alias must be followed by true or false! \n\n';npm config set ignore-scripts"
alias alnvm="source $MYCONFIG_ROOT_DIR/COMMON/common_nvm.sh"
alias alvsc='code -n ' ### open sth with VSC
alias alsource="source ~/.bashrc"
alias altsnodecommonjs='ts-node --compiler-options "{\"module\": \"commonjs\",\"lib\":[\"es2015\",\"dom\"]}"'
alias alwork='cd ~/work'

##############################################################
# Git Shortcuts
##############################################################
alias gac="git add . && git commit -a -m " ### Just add message
alias gitlog="printf '\n\nAlias: git log --oneline\n\n' && git log --oneline"
alias gitl="printf '\n\nAlias: git log --oneline\n\n' && git log --oneline"
alias gits="printf '\n\nAlias: git status\n\n' && git status"
alias gitb="printf '\n\nAlias: git branch\n\n' && git branch"
alias gitbs="printf '\n\nAlias: git branch && git status\n\n' && git branch && printf '\n' && git status"
alias gitc="printf '\n\nAlias: git checkout\n\n' && git checkout"
