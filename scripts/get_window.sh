#!/usr/bin/env bash

###############################################################
# This script gets the process id of the focus window
# It then uses lsof to get the working directory of that window
# This assumes it is a terminal
# Works using terminator and ubuntu
# Requires xdotool, ps and lsof
###############################################################


pid=$(xdotool getwindowpid $(xdotool getwindowfocus))      # Get parent id
cid=`ps axjf | awk '/^\s*'$pid'/ && /bash/ {print $3}'`    # Find the terminal by grepping for bash

lsof -p $cid | awk '/cwd/ {print $9}'                      # Print the working directory of the bash terminal
