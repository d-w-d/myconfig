#!/usr/bin/env false

### iTerm2 Utilities
### To create ~/.iterm2 dir, you need to run `iterm2 > Install Shell Integration` with
### `Also install iTerm2 Utilities` checked
export PATH="$HOME/.iterm2:$PATH"

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=1

[ $BASH ] && [ -f $HOME/.iterm2_shell_integration.bash ] && source $HOME/.iterm2_shell_integration.bash

[ $(echo $SHELL | grep zsh | wc -l) ] && [ -f $HOME/.iterm2_shell_integration.zsh ] && source $HOME/.iterm2_shell_integration.zsh
