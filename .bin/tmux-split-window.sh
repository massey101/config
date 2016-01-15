#!/bin/bash
pane=$(echo "$1" | tr -d '%')
pane_path=$(tmux show-environment TMUX_"$pane"_PATH | sed 's/^[^=]*=//g')
tmux set-environment NEWW "$pane_path"
tmux split-window $2

