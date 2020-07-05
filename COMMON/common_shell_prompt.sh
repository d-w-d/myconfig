#!/usr/bin/env false

###################################################
### Customize command prompt:
###################################################

### See: https://bit.ly/31cn9qa
### If __git_ps1 is defined (by sourcing bash_completion previously)
### then use it to include active branch in prompt:

DEFAULT=$PS1

if [ $BASH ] && [ -n "$(type -t __git_ps1)" ]; then
    ### This is taken from lynda.com git tutorial: export PS1='\W$(__git_ps1 "(%s)") > '
    PS1='\n\[\033[01;32m\][ \W \[\033[01;33m\]$(__git_ps1 "| %s ")\[\033[01;32m\]] \[\033[00m\] '
else
    PS1='\n\[\033[01;32m\][ \W ] \[\033[00m\] '
fi

