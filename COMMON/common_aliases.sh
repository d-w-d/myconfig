#!/usr/bin/env false

### Inherit $MYCONFIG_ROOT_DIR from parent script
MYCONFIG_ROOT_DIR=${MYCONFIG_ROOT_DIR:-"$HOME/.myconfig"}

### Modify 'ls' family (this assumes you use a recent GNU ls).
alias ls='ls -F'            # Sort with color and file-type indicator
alias lsDirsOnly='ls -d'    # List just dir names (not their content).
alias lsSortBySize='ls -Sr' # Sort by size, biggest last
alias lt='ls -ltr'          # Sort by date, most recent last.

### Useful Aliases for All *NIX Environments
alias alcatcolored='highlight -O ansi --force'
alias alclear="clear && printf '\e[3J'"
alias aldu="du -hsc ./* ./.* 2> /dev/null"
alias klear="clear && printf '\e[3J'"
alias kl="clear && printf '\e[3J'"

alias alangularcompletion="source <(ng completion script)"

alias aldockerstopcontainers=$'docker stop $(docker ps -aq)'
alias aldockerrmcontainers=$'docker rm $(docker ps -aq)'
alias aldockerkillcontainers=$'docker kill $(docker ps -aq)'

alias alhttpserver='http-server'
alias alimgcat='~/.local/bin/imgcat --height 10' # For imgcat installed with
# `pip3 install --user imgcat`
alias alipaddress="curl http://ipecho.net/plain; echo"
alias aljs='cd ~/work/javascript'
alias allocaltunnel='lt' ### Use e.g. --port 8080
alias alneighbours="ip neigh | awk '{ print $1 }' | xargs -n1 host"
alias alnpmconfigsetignorescripts="printf '\n\n This alias must be followed by true or false! \n\n';npm config set ignore-scripts"
alias alnvm="source $MYCONFIG_ROOT_DIR/COMMON/common_nvm.sh"
alias alpasswordgen=$'echo $(($(date '+%s') * $RANDOM))  | sha256sum | base64 | head -c 32 ; echo'
#source $MYCONFIG_ROOT_DIR/COMMON/common_nvm.sh &

alias aldockermongo="clear; printf '\n\n Starting temp mongod server. Connect mongoose with \"mongodb://127.0.0.1\" ... \n\n'; sleep 3;docker run -p "27017:27017" mongo:latest"

alias alvsc='code -n ' ### open sth with VSC
alias alsource="source ~/.bashrc"
alias alsudovim="sudo -E $(which vim)"
alias altsnodecommonjs='ts-node --compiler-options "{\"module\": \"CommonJS\",\"lib\":[\"es2020\",\"dom\"],\"resolveJsonModule\":true}"'
alias alwork='cd ~/work'

### Git Shortcuts
alias gac="git add . && git commit -a -m " ### Just add message
alias gitlog="printf '\n\nAlias: git log --oneline\n\n' && git log --oneline"
alias gitl="printf '\n\nAlias: git log --oneline\n\n' && git log --oneline"
alias gits="printf '\n\nAlias: git status\n\n' && git status"
alias gitb="printf '\n\nAlias: git branch\n\n' && git branch"
alias gitdateofcommit="printf '\n\nAlias: git show -s --format=%ci <commit>\n\n' && git show -s --format=%ci "
alias gitcredentials="printf '\n\nAlias: git config --global user.name \"[name]\" and git config --global user.email \"[email address]\""
