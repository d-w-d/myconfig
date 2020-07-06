# Debian Setup Notes

## What's This?

These are notes to assist with setup on Debian systems after running `myconfig_full_install`.

## Notes

- On Ubuntu 18.04, the vundle plugin 'YouCompleteMe' doesn't properly install. Run the following to complete it:
    - sudo apt install python3-pip  
    - pip3 install cmake
    - cd $HOME/.vim/bundle/YouCompleteMe/
    - python3 install.py
