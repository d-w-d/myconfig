#!/usr/bin/env false
#
# Because I always forget how I set up vim after not using it for a while!

read -r -d '' VIM_USAGE <<-EOM
${GOLD_BLUE}
=====================================================================
\\\`x - jump to last place you used 'x', etc.

NERDTREE: you use this to set up the menu navigation functionality
  - ':help NERDTree' for documentation
  - '<Leader>n' to toggle menu
  - 'I' in menu to toggle hidden files

RESIZE WINDOWS: you set up the following mappings:
  - '<Leader>mw' for "more width" in present window
  - '<Leader>lw' for "less width" in present window
  - '<Leader>mmw' for "much more width" in present window
  - '<Leader>mlw' for "much less width" in present window
  - '<Leader>mh' for "more height" in present window
  - '<Leader>lh' for "less height" in present window
  - '<Leader>mmh' for "much more height" in present window
  - '<Leader>mlh' for "much less height" in present window

COPYING TEXT:
  - '<Leader>c' to 'yank' text to clipboard
  - '<Leader>s' to toggle between my preferred system of copying text
                to the default setup

CLEARING ALL MARKS:
  - :delmarks a-zA-Z
=====================================================================
${WHITE_BLACK}
EOM

alias alusagevim="echo \"$VIM_USAGE\""
