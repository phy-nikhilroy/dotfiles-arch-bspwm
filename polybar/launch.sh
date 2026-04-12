#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch the bar named "main" from our config
echo "---" | tee -a /tmp/polybar1.log
polybar main 2>&1 | tee -a /tmp/polybar1.log &
disown

echo "Bar launched..."
