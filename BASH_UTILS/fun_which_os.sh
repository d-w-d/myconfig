#!/usr/bin/env false 


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
}

export -f fun_which_os
