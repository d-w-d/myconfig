#!/usr/bin/env false

##################################################################
### Useful functions for debian
##################################################################

# RPi voltage display
fun_volt_calc() {
    ### Note: make this more sophisticated in the future!!!
    for id in core sdram_c sdram_i sdram_p; do
        echo -e "$id:\t$(vcgencmd measure_volts $id)"
    done
}
#export -f fun_volt_calc

function fun_temp {
    echo "Temp function is working"
}

# Show all users
fun_show_all_users() {

    # Name: listusers.bash
    # Purpose: List all normal user and system accounts in the system. Tested on RHEL / Debian Linux
    # Author: Vivek Gite <www.cyberciti.biz>, under GPL v2.0+
    # Source: https://www.cyberciti.biz/faq/linux-list-users-command/
    # -----------------------------------------------------------------------------------
    _l="/etc/login.defs"
    _p="/etc/passwd"

    ## get mini UID limit ##
    l=$(grep "^UID_MIN" $_l)

    ## get max UID limit ##
    l1=$(grep "^UID_MAX" $_l)

    ## use awk to print if UID >= $MIN and UID <= $MAX and shell is not /sbin/nologin   ##
    echo "----------[ Normal User Accounts ]---------------"
    awk -F':' -v "min=${l##UID_MIN}" -v "max=${l1##UID_MAX}" '{ if ( $3 >= min && $3 <= max  && $7 != "/sbin/nologin" ) print $0 }' "$_p"

    echo ""
    echo "----------[ System User Accounts ]---------------"
    awk -F':' -v "min=${l##UID_MIN}" -v "max=${l1##UID_MAX}" '{ if ( !($3 >= min && $3 <= max  && $7 != "/sbin/nologin")) print $0 }' "$_p"

}

#export -f fun_show_all_users


#################################################
### Show resources of some greped running process
#################################################
fun_resources_used() {

    if [[ -z $1 ]]; then
        echo "Function requires exactly one argument!"
        return 1
    fi

    clear
    echo ""
    echo "ORIGINAL SEARCH TERM: "$1
    echo ""

    # Get top info; save to file to preserve line info (so we can grep it)
    text=/tmp/temp.txt
    top -bn1 >$text

    ### Extract column headers
    # PID COMMAND %CPU TIME #TH   #WQ  #PORTS MEM    PURG   CMPRS  PGRP  PPID  STATE
    # 1     2       3   4   5       6   7       8       9       10  11      12  13
    headers_array=($(cat $text | grep "PID" | tr -s "[:blank:]" | xargs -I XXX echo XXX | cut -f1-13 -d" "))
    headers_length=${#headers_array[@]}

    # Find all commands matched with original search term
    all_commands=($(cat $text | grep "$1" | tr -s "[:blank:]" | xargs -I XXX echo XXX | cut -f12 -d" "))
    all_commands_length=${#all_commands[@]}

    if [ $all_commands_length -eq 0 ]; then
        echo "No process found with matching command!"
        return 0
    fi

    # If more than one command matched, get user to select one command/process
    if [ $all_commands_length -gt 1 ]; then
        echo ""
        echo "These are the commands of all matched processes. Pick a NUMBER to continue:"
        echo ""
        for ((i = 0; i < all_commands_length; i++)); do echo "$i) ""${all_commands[$i]}"; done
        read selected_index
        selected_command="${all_commands[$selected_index]}"
    else
        # Else, use the only command matched
        selected_command="${all_commands[0]}"
    fi

    printf "Matched command: "$selected_command"\n\n"

    # Use $selected_command to find line; put fields into an array
    results_array=($(cat $text | grep "$selected_command" | tr -s "[:blank:]" | xargs -I XXX echo XXX | cut -f1-13 -d" "))
    results_array_length=${#results_array[@]}

    # Print line for each entry in headers_array and results_array
    echo "-----------------------------"
    for ((i = 0; i < 12; i++)); do
        col_title="${headers_array[$i]}"
        col_title_length=$(echo -n $col_title | wc -c)
        divider_length=$((8 - $col_title_length))
        divider=$(printf "%0.s-" $(seq 1 $divider_length))"> " #| tr ' ' " "
        col_entry="${results_array[$(($i))]}"
        echo $col_title":" $divider $col_entry
    done
    echo "-----------------------------"

}

#export -f fun_resources_used

