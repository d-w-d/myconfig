# Myconfig

## What's This?

This repo is for setting up highly customized bash/zsh shell environments for MacOS, Debian and Centos/RHEL machines.

## Quick Start

`source <(curl -L https://raw.githubusercontent.com/d-w-d/myconfig/master/quickstart.sh)`

## How It Works

### Two-Phase Installation

This repo works in two phases: 'quickstart' and 'full installation'.

### Bootstrap Install

First, the 'Quick Start' command above is designed to get you working in a productive bash shell as quickly as possible on any Mac, Debian or RHEL machine without adversley affecting whatever user's account you might happen to be using. It clones this repo to `/tmp/myconfig`, and, if vim is installed, it triggers the installation of vundle and its plugins in the background, and then aliases vim to use all my settings/plugins.

This quick/temporary installation leaves you in a bash shell with handy aliases for that operating system (e.g. `alportsinuse` will list ports in use on that machine, `klear` will clear the terminal history), and a CLI called `myconfig` that you can use to perform a full/permanent installation.

### Full Installation

`myconfig install self` *will* mess with the config files in the user's home dir, and so is supposed to only be run on accounts that are designated for me. Basically, it clones this repo to `$HOME/.myconfig`, and enables you to install modern versions of vim, tmux, zsh, git and ohmyzsh.

### Phase Three

The function `myconfig_FULL_installation` does *not* perform sophisticated checks/auto-installations of versioned software. For example, it will configure for tmux >v2.1, but you'll have to manually install tmux >v2.1 if it's not available on that machine.

Phase three is thus for such manual installation of software/configuration depending on what's available on the machine, and how much I expect to use that machine in the future. Phase three is facilitated by helper scripts available in `myconfig` that, for example, install the latest version of tmux, vim and zsh with/without root permissions.

For a machine that I expect to do serious work on, I'll want to make sure that we have up-to-date zsh, tmux, and vim with python3 and clipboard support.


## `.myconfig` vs `.myfs`

The dir `$HOME/.myconfig` has all the libraries/scripts needed to install my tools onto a \*nix system. When `~/.myconfig/entry.sh` is sourced, it will make sure that a user--specific filesystem called `~/.myfs` exists. This is where libraries/executables installed by scripts in `.myconfig` end up.


## Conventions

Whenever possible, I'm trying to follow the [Google style guide](https://google.github.io/styleguide/shellguide.html) for shell scripting.

### Libraries

'Scripts' in the myconfig repo that are only supposed to be sourced are:

1. Referred to as 'libraries'
2. Given .sh suffixes
3. Given the shebang `#!/usr/bin/env false` to prevent direct execution
4. Sourceable by both bash and zsh

### Executable Scripts

Scripts in the myconfig repo that are supposed to be executed are:

1. Referred to as (executable) scripts
2. Given no suffix
3. Given the shebang `#!/usr/bin/env bash`
4. Placed in `.bin` directories within their respective OS dirs

Note: myconfig is designed with the intention that you only ever run executable scripts through the CLI. 










