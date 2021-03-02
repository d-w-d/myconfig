#!/usr/bin/env false

### Make sure we are not aliasing vim to /tmp if myconfig is installed
### This needs to come after common_env so that we can find the 
### _is_myconfig_fully_installed cmd
_is_myconfig_fully_installed && unalias vim 2>/dev/null
