#!/bin/bash

PID=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.type=="con") | select(.focused==true).pid')
CHILD_PID=$(pgrep -P $PID)
SHELL_CWD=$(readlink /proc/$CHILD_PID/cwd)

if [ ! -z "$SHELL_CWD" ]
then
    alacritty --working-directory $SHELL_CWD
else
    alacritty
fi
