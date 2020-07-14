# Myconfig

## What's This?

This repo is for setting up bash/zsh shell environments, with customized settings for MacOS, Debian and Centos/RHEL machines.

## Quick Start

`TMPFILE=$(mktemp); curl -o- https://raw.githubusercontent.com/dan-drago/myconfig/master/COMMON/common_env.sh > $TMPFILE; curl -o- https://raw.githubusercontent.com/dan-drago/myconfig/master/tmp_install.sh >> $TMPFILE; bash --rcfile $TMPFILE`

## How It Works


### Three-Phase Installation

This repo works in three phases.

### Phase One

First, the 'quickstart' command above is designed to get you working in a productive bash shell as quickly as possible without messing with that user's configuration files. It clones this repo to `/tmp/myconfig`, triggers the installation of vundle and its plugins in the background, and then aliases vim to use all my settings/plugins. This is referred to as the 'temporary install'.

The temporary installation leaves you in a bash shell with handy aliases for that operating system (e.g. `alportsinuse` will list ports in use on that machine, `klear` will clear the terminal history), and a function called `myconfig_full_installation`.

Note: the `tmp_installation.sh` library will check if vim is installed; if not, it will prompt you on how to install it.   

### Phase Two

`myconfig_full_installation` *will* mess with the config files in the user's home dir, and so is supposed to only be run in accounts that are designated for me. Basically, it copies `/tmp/myconfig` to `$HOME/.myconfig`, and and then copies commands/files for long-term usage of vim, tmux, bash and zsh according to my preferences.

### Phase Three

The function `myconfig_FULL_installation` does *not* perform sophisticated checks/auto-installations of versioned software. For example, it will configure for tmux >v2.1, but you'll have to manually install tmux >v2.1 if it's not available on that machine.

Phase three is thus for such manual installation of software/configuration depending on what's available on the machine, and how much I expect to use that machine in the future. Phase three is facilitated by helper scripts available in `myconfig` that, for example, install the latest version of tmux, vim and zsh with/without root permissions.

For a machine that I expect to do serious work on, I'll want to make sure that we have up-to-date zsh, tmux, and vim with python3 and clipboard support.

## Technologies Configured

1. bash
2. zsh
2. vim
3. tmux
4. iTerm2


