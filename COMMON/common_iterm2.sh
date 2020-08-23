#!/usr/bin/env false

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=1

[ $BASH ] && [ -f $HOME/.iterm2_shell_integration.bash ] && source $HOME/.iterm2_shell_integration.bash

[ $(echo $SHELL | grep zsh | wc -l) ] && [ -f $HOME/.iterm2_shell_integration.zsh ] && source $HOME/.iterm2_shell_integration.zsh

