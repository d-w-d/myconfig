#!/usr/bin/env false
#
# Define functions useful across all *NIX platforms



#################################################
# Echos message regarding aborting of
#   function/Script
# Globals:
#   None
# Arguments:
#   Optional message
# Outputs:
#   Writes type of file to stdout
#################################################
function fun_abort_install() {
    # Provide message as to why we're aborting install
    if [[ $1 ]]; then
        echo $1
    else
        echo "Aborting install for unspecified reason"
    fi
    exit 1
}

[ $BASH ] && export -f fun_data_type

#################################################
# Returns data type regardless of bash or zsh
# Globals:
#   None
# Arguments:
#  Target data structure
# Outputs:
#   Writes type of file to stdout
#################################################
function fun_data_type {

    ### Ensure an argument is given pointing to the target data structure
    [ -z $1 ] && echo "fun_data_type needs an argument!"  &&  return 1


    ### Echo result based on active shell
    if [ $BASH ];then
        echo $(type -t $1)
    elif [ $ZSH_VERSION ];then
        echo whence -w $1 | cut -f2 -d ' '
    else
        echo "fun_data_type is only designed to be run from a bash or zsh shell!"  &&  return 1
    fi
    return 0
}

[ $BASH ] && export -f fun_data_type

#################################################
# Determines operating system of present machine
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Writes content of $OS to stdout
#################################################
function fun_which_os {
    OS="UNKNOWN"
    if [[ $(uname -s) == Darwin ]]; then OS="MACOS"; fi

    if [[ $(uname -s) == Linux ]]; then
        if [[ $(cat /etc/os-release | grep -E "ID_LIKE(.*)rhel" | wc -l) == 1 ]]; then
            OS="RHEL"
        fi
        if [[ $(cat /etc/os-release | grep -Ei "ID_LIKE(.*)debian" | wc -l) == 1 ]]; then
            OS="DEBIAN"
        fi
    fi
    echo $OS
    return 0
}

[ $BASH ] && export -f fun_which_os

#################################################
# Install Vundle Plugins as background process;
#   also installs cmake and YCM via call to separate function
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Eventually writes message to stdout stating
#   that the installation is complete
#################################################
fun_bg_install_vundle_plugins() {

    ### Confirm some prereqs
    [[ ! -d /tmp/myconfig ]] && echo "/tmp/myconfig not found" && return 1
    hash vim >/dev/null 2>&1 || (echo "vim not found" && return 1)

    ### Clone/update vundle repo
    if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
        # If Vundle not installed then clone it
        git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    else
        # If Vundle dir exists, update it
        cd $HOME/.vim/bundle/Vundle.vim
        git fetch origin
        git checkout master
        git reset --hard origin/master
    fi

    ### Install vundle plugins as bg process then print message
    ### If cmake is absent, then also complete ycm installtion
    echo "Installing vundle plugins..."
    ((TEMP=$(vim -E -N -u /tmp/myconfig/.vimrc +PluginInstall +qall;
    echo -e "echo '''\033[31m
    ================================================
    VUNDLE PLUGINS HAVE FINISHED INSTALLING/UPDATING
    ================================================\n\033[37m''';";
    hash cmake >/dev/null 2>&1 || fun_complete_ycm_installation  >/dev/null 2>&1;
    ); bash -c "$TEMP" ) &)
    return 0
}

[ $BASH ] && export -f fun_bg_install_vundle_plugins

########################################################
# Completes installation of YouCompleteMe Vundle Plugin.
#   Needed because ycm needs cmake for installation,
#   and this may not be available on your machine.
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Eventually writes message to stdout stating
#   that the installation is complete
########################################################
fun_complete_ycm_installation() {

    ### Confirm prereqs
    [[ ! -d $HOME/.vim/bundle ]] && echo "$HOME/.vim/bundle not found" && return 1
    hash python3 >/dev/null 2>&1 || (echo "python3 not found" && return 1)
    hash pip3 >/dev/null 2>&1 || (echo "pip3 not found" && return 1)

    echo "Completing installation of YouCompleteMe..."
    ((TEMP=$(PREVIOUSDIR=$PWD;
    cd $HOME/.vim/bundle/YouCompleteMe;
    git submodule update --init --recursive;
    python3 -m pip install --user cmake > /dev/null 2>&1;
    python3 install.py --clang-completer > /dev/null 2>&1;
    echo -e "echo '''\033[31m
    ====================================
    YouCompleteMe Installation Finalized
    ====================================\n\033[37m''';
    "; cd $PREVIOUSDIR); bash -c "$TEMP" ) &)

    return 0
}

[ $BASH ] && export -f fun_complete_ycm_installation


#################################################
# TODO: NEEDS COMPLETION/REFINEMENT
# Show resources of some greped running process
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Eventually writes OS to stdout
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
    top -l1 >$text

    ### Extract column headers
    # PID COMMAND %CPU TIME #TH   #WQ  #PORTS MEM    PURG   CMPRS  PGRP  PPID  STATE
    # 1     2       3   4   5       6   7       8       9       10  11      12  13
    headers_array=($(cat $text | grep "PID" | tr -s "[:blank:]" | cut -f1-13 -d" "))
    headers_length=${#headers_array[@]}

    # Find all commands matched with original search term
    all_commands=($(cat $text | grep "$1" | tr -s "[:blank:]" | cut -f2 -d" "))
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
    results_array=($(cat $text | grep "$selected_command" | tr -s "[:blank:]" | cut -f1-13 -d" "))
    results_array_length=${#results_array[@]}

    # Print line for each entry in headers_array and results_array
    echo "-----------------------------"
    for ((i = 0; i < 13; i++)); do
        col_title="${headers_array[$i]}"
        col_title_length=$(echo -n $col_title | wc -c)
        divider_length=$((8 - $col_title_length))
        divider=$(printf "%0.s-" $(seq 1 $divider_length))"> " #| tr ' ' " "
        col_entry="${results_array[$(($i))]}"
        echo $col_title":" $divider $col_entry
    done
    echo "-----------------------------"

}

[ $BASH ] && export -f fun_resources_used
