# Ubuntu Server 18.04 Setup Notes

## What's This?

Notes on setting up myconfig on ubuntu-server-18.04.



## VIM with Clipboard

- With sudo permissions:
    - sudo apt install vim-gtk3
        - NOTE: installs binary to /usr/bin/vim.gtk3
    - Add alias to misc.sh
- Without sudo permissions:
    - 


## ZSH Installation

- With sudo permissions:
    - sudo apt install zsh
- Without sudo permissions:
    - Build from source; see e.g. https://stackoverflow.com/a/15293565/8620332

## Vundle YouCompleteMe Installation

The vundle plugin 'YouCompleteMe' doesn't get properly installed. Fix:
- With sudo permissons:
    - sudo apt install python3-pip  
    - python3 -m pip install cmake
    - cd $HOME/.vim/bundle/YouCompleteMe/
    - python3 install.py
- Without sudo permissions (Untested):
    - cd /tmp
    - wget https://bootstrap.pypa.io/get-pip.py
    - python3 get-pip.py --user
    - ...

## Powerline Installation

- With sudo permissons:
    - sudo apt install powerline
- Without sudo permissons:
    - pip install --user powerline-status
