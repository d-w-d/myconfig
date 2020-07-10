# Myconfig
## What's This?

This repo is used as a single source of truth for setting up bash/zsh shell environments, with customized settings for MacOS, debian and centos machines.

## Quick Start

`TMPFILE=$(mktemp); curl -o- https://raw.githubusercontent.com/dan-drago/myconfig/master/tmp_install.sh > $TMPFILE; bash --rcfile $TMPFILE `

## How It Works


### Three-Phase Installation

This repo works in three phases. 

### Phase One

First, the 'quickstart' command above is designed to get you working in a productive bash shell as quickly as possible. It clones this repo to `/tmp/mycomfig`, installs vundle and all vundle plugins in the background, and then aliases vim to use all my settings/plugins. This is referred to as the 'temporary install'. The idea is to enable me to be productive on a new machine as quickly as possible (especially with regards to vim) without messing with that's user's configuration files.

The temporary installation leaves you in a bash shell with handy aliases for that operating system (e.g. `alportsinuse` will list ports in use on that machine; `klear` will clear the terminal history), and a function called `myconfig_full_instalation`. 

### Phase Two

`myconfig_full_instalation` *will* mess with the user's config files, and so is designed to only be applied to user accounts that are designated for me specifically. Basically, it copies `/tmp/myconfig` to `$HOME/.myconfig`, and copies commands/files for long-term usage of vim, tmux and bashrc according to my perferences.

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


