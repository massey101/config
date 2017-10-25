#!/bin/bash
if [ "$1" != "+" ] && [ "$1" != "-" ]; then
    echo "usage: tmux-move.sh +|-"
    exit 1
fi
current=$(tmux list-windows | grep "active" | cut -f 1 -d " " | cut -f 1 -d ":")
target=$(expr $current $1 1)

if tmux list-windows | grep -q "^$target:"; then
    tmux swap-window -t $target
else
    tmux move-window -t $target
fi

