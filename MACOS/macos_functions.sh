#!/usr/bin/env false


#################################################
# Show all users
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Writes to stdout
#################################################
fun_show_all_users() {
    dscl . list /Users
}

[[ $BASH ]] && export -f fun_show_all_users
