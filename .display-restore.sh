#!/usr/bin/env bash

# Name of internal and external displays — update these if needed
INTERNAL="eDP-1"
EXTERNAL="HDMI-1"

# Default direction
DIRECTION="right-of"

# Check for optional argument
if [[ "$1" == "l" || "$1" == "left" ]]; then
    DIRECTION="left-of"
elif [[ -n "$1" && "$1" != "r" && "$1" != "right" ]]; then
    echo "Usage: $0 [l|left|r|right]"
    echo "Default is right."
    exit 1
fi

# Apply display config
xrandr --output "$EXTERNAL" --auto --"$DIRECTION" "$INTERNAL"

# Allow time for display change
sleep 1

# Restore wallpapers
nitrogen --restore

