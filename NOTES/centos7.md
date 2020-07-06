# Centos7

## VIM With Clipboard and Python3

- With sudo permissions:
    - Follow this guy roughly: https://superuser.com/a/1423505/978730
        - mkdir -p ~/usr/local
        - cd /tmp
        - curl -o ncurses.tar.gz http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
        - tar -xzvf ncurses.tar.gz
        - cd ncurses-6.2
        - sudo yum install gcc
        - ./configure --prefix=$HOME/usr/local
        - make && make install
        - cd /tmp
        - git clone https://github.com/vim/vim.git
        - cd vim/src
        - sudo yum-builddep vim
        - sudo yum install python3
        - LDFLAGS=-L$HOME/usr/local/lib ./configure --enable-gui=auto --enable-pythoninterp=yes --enable-python3interp=yes --enable-gtk2-check --with-x --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu --enable-fail-if-missing --prefix=$HOME/usr/local
        - make && make install







