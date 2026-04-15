#!/bin/bash

TITLE="cheatsheet_peek"

# check if feh is already running
if pgrep -f "$TITLE" >/dev/null; then
  pkill -f "$TITLE"
else
  # F fullscreen, Z auto-zoom to fit screen, Y hide pointer
  feh -F -Z -Y --title "$TITLE" ~/Pictures/cheatsheets/ &
fi
