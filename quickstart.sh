#!/usr/bin/env false
#
# Library to temporarily install myconfig to /tmp and enable rapid productivity

# Variables, params, etc.
vim_status=""
previous_dir=$PWD
vundle_download_message="${RED}Vundle plugins can't be installed until vim is${WHI}"

# Require git
hash git >/dev/null 2>&1 || echo "Git is not installed. Aborting installation."

# Only perform quickstart if myconfig is not already fully installed
if [[ -d $HOME/.myconfig ]]; then
    echo -e """${RED}

    Dir ~/.myconfig already exists!

    Either run \`myconfig update\` to update it,
    or remove \`~/.myconfig\` in order to run quickstart afresh.

    Exiting...

    ${WHI}"""
    return 1
fi

# Clone/Update myconfig Repo
if [[ -d /tmp/myconfig ]]; then
    echo -e "Updating git repo for myconfig..."
    cd /tmp/myconfig
    git fetch origin
    git checkout master
    git reset --hard origin/master
else
    echo -e "Cloning git repo for myconfig..."
    cd /tmp
    git clone https://github.com/d-w-d/myconfig.git
    cd myconfig
    touch misc.sh
fi

# Expose tools in /tmp/myconfig to this shell
MYCONFIG_ROOT_DIR=/tmp/myconfig source /tmp/myconfig/entry.sh

# Test if VIM is installed
if $(hash vim >/dev/null 2>&1); then
    ### Vim is installed, so alias it to our temp .vimrc file
    alias vim="vim -N -u /tmp/myconfig/.vimrc"

    if [[ $1 == "--verbose" ]];then
        ### Download vundle plugins in an explicit/blocking fashion
        echo -e "${CYA}Showing vim output explicitly${WHI}"
        _update_or_install_vundle_plugins
    else
        # Download vundle plugins as a background process
        # NOTE:   this WILL create/update vim-related utilities in user's $HOME dir,
        #         but will not delete anything
        echo -e "${WHI}Downloading vim-vundle plugins as background process..."
        ((cmd=$(/usr/bin/env true;
        _update_or_install_vundle_plugins >/dev/null 2>&1;
        echo -e "echo '''\033[31m
        ================================================
        VUNDLE PLUGINS HAVE FINISHED INSTALLING/UPDATING
        ================================================\n\033[37m''';";
        ); bash -c "$cmd" ) &)
        vundle_download_message="${GRE}Vundle plugins are being downloaded "
        vundle_download_message+="as a background process!\n${WHI}"
        vundle_download_message+="${RED}         ---> DO NOT CLOSE THIS SHELL <---\n${WHI}"
        vundle_download_message+="${GRE}  A message will be printed to this stdout when complete!${WHI}"
    fi

    # Check if installed vim has python3 and clipboard support
    if [[ $(vim --version | grep -E '\-python3|\-clipboard') ]]; then
        vim_status=""
        vim_status+="${RED}WARNING!${GRE} Vim is installed BUT does "
        vim_status+="not have BOTH python3 AND clipboard support; \n"
        vim_status+="  To install vim with these features, run:\n"
        vim_status+="${CYA}  myconfig install self \n"
        vim_status+="${CYA}  myconfig install vim${WHI}"
    else
        vim_status="- $(type vim 2>&1)"
    fi
else
    vim_status="${RED}vim is not installed${WHI}"
fi

# Print instructions to user
echo -e """${GRE}
=======================================
MYCONFIG HAS BEEN ${RED}TEMPORARILY${GRE} INSTALLED
=======================================
${GRE}
- Configuration scripts have been cloned to ${WHI}/tmp/myconfig${GRE}

- Bash has sourced ${WHI}/tmp/myconfig/entry.sh${GRE}

- Use the CLI \`myconfig\` to perform further installations, etc.

- $vim_status

- $vundle_download_message

"""

# Clean up
cd $previous_dir
unset previous_dir
unset vim_status
