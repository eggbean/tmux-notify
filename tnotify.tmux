#!/usr/bin/env bash

# Get current directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PID_DIR="$XDG_CACHE_HOME/tmux/tmux-notify"

# Initialize variables
source "$CURRENT_DIR/scripts/helpers.sh"
source "$CURRENT_DIR/scripts/variables.sh"

# prepare pid file directory
if [[ ! -d $PID_DIR ]]; then
  mkdir $PID_DIR
fi

# Bind plugin keys
tmux bind-key -N "Start monitoring pane and notify when it finishes"       a   run-shell -b "$CURRENT_DIR/scripts/notify.sh"
tmux bind-key -N "Start monitoring pane and return focus when it finishes" M-a run-shell -b "$CURRENT_DIR/scripts/cancel.sh"
tmux bind-key -N "Cancel monitoring of pane"                               A   run-shell -b "$CURRENT_DIR/scripts/notify.sh refocus"
