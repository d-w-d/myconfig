#!/usr/bin/env false

################################################################
### iTerm Integration
### (You first need to run `iTerm2 > Install Shell Integration`
###  and then have this run on each shell start up)
################################################################
#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### GIT AUTOCOMPLETION
### See: https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
[[ $BASH ]] && [[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion
