#!/usr/bin/env false
#
# Handy color definitions for terminal output
#
# The  general way of diong things is to combine the escape character
# follow by a coded sequence representing a color, style, etc.
#
# For example, \e[30m combines the escape character (ASCII ESC 27)
# with the code for black foreground
#
# Note that there are several ways to express the escape char:
# \e    (most common / universally recognized)
# \033 (octal)
# \u001b (unicode)
#
# The following is a list of codes given by chat GPT:
#
# <<<--- Text Formatting: --->>>
# Reset: 0m - Resets all attributes to their defaults.
# Bold: 1m - Makes the text bold.
# Dim: 2m - Dims the text.
# Italic: 3m - Makes the text italic.
# Underline: 4m - Underlines the text.
# Blink: 5m - Makes the text blink (often not supported).
# Reverse: 7m - Swaps foreground and background colors.
# Hidden: 8m - Hides the text (useful for passwords).
# <<<--- Foreground (Text) Colors (Standard): --->>>
# Black: 30m
# Red: 31m
# Green: 32m
# Yellow: 33m
# Blue: 34m
# Magenta: 35m
# Cyan: 36m
# White: 37m
# Background Colors (Standard):
# Black: 40m
# Red: 41m
# Green: 42m
# Yellow: 43m
# Blue: 44m
# Magenta: 45m
# Cyan: 46m
# White: 47m
# <<<--- Bright Foreground (Text) Colors: --->>>
# Bright Black (Gray): 90m
# Bright Red: 91m
# Bright Green: 92m
# Bright Yellow: 93m
# Bright Blue: 94m
# Bright Magenta: 95m
# Bright Cyan: 96m
# Bright White: 97m
# Bright Background Colors:
# Bright Black (Gray): 100m
# Bright Red: 101m
# Bright Green: 102m
# Bright Yellow: 103m
# Bright Blue: 104m
# Bright Magenta: 105m
# Bright Cyan: 106m
# Bright White: 107m
# <<<--- # Advanced Color Options: --->>>
# 256-Color Foreground: 38;5;<n>m - Where <n> is a color code ranging from 0 to 255.
# 256-Color Background: 48;5;<n>m - Similar to foreground but for background colors.
# 24-bit Color (RGB) Foreground: 38;2;<r>;<g>;<b>m - Where <r>, <g>, and <b> are red, green, and blue color values (0-255).
# 24-bit Color (RGB) Background: 48;2;<r>;<g>;<b>m - Similar to foreground but for background colors, using RGB values.

### Resets both font and background
export RES="\033[0m"
export RESET="\033[0m"

### Sets FONT color for terminal output
export BLA="\033[30m"
export RED="\033[31m"
export GRE="\033[32m"
export YEL="\033[33m"
export BLU="\033[34m"
export MAG="\033[35m"
export CYA="\033[36m"
export WHI="\033[37m"
export PIN="\033[38;5;213m"
export GOL="\033[38;5;220m"

export FBLA="\033[30m"
export FRED="\033[31m"
export FGRE="\033[32m"
export FYEL="\033[33m"
export FBLU="\033[34m"
export FMAG="\033[35m"
export FCYA="\033[36m"
export FWHI="\033[37m"
export FPIN="\033[38;5;213m"
export FGOL="\033[38;5;220m"

export BLACK="\033[30m"
export RED="\033[31m"
export GREEN="\033[32m"
export YELLOW="\033[33m"
export BLUE="\033[34m"
export MAGENTA="\033[35m"
export CYAN="\033[36m"
export WHITE="\033[37m"
export PINK="\033[38;5;213m"
export GOLD="\033[38;5;220m"

export FBLACK="\033[30m"
export FRED="\033[31m"
export FGREEN="\033[32m"
export FYELLOW="\033[33m"
export FBLUE="\033[34m"
export FMAGENTA="\033[35m"
export FCYAN="\033[36m"
export FWHITE="\033[37m"
export FPINK="\033[38;5;213m"
export FGOLD="\033[38;5;220m"

### Sets BACKGROUND color for terminal output
export BBLA="\033[40m"
export BRED="\033[41m"
export BGRE="\033[42m"
export BYEL="\033[43m"
export BBLU="\033[44m"
export BMAG="\033[45m"
export BCYA="\033[46m"
export BWHI="\033[47m"
export BPIN="\033[48;5;213m"
export BGOL="\033[48;5;220m"

export BBLACK="\033[40m"
export BRED="\033[41m"
export BGREEN="\033[42m"
export BYELLOW="\033[43m"
export BBLUE="\033[44m"
export BMAGENTA="\033[45m"
export BCYAN="\033[46m"
export BWHITE="\033[47m"
export BPINK="\033[48;5;213m"
export BGOLD="\033[48;5;220m"

### Sets nice FONT_BACKGROUND combos
export GOLD_BLUE="${FGOL}${BBLU}"
export WHITE_BLACK="${FWHI}${BBLA}"
export BLACK_WHITE="${FBLA}${BWHI}"
export RED_CYAN="${FRED}${BCYA}"
export GREEN_MAGENTA="${FGRE}${BMAG}"
export RED_ORA="${FYEL}${BPUR}"
