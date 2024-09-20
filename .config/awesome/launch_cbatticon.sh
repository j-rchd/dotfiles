#!/bin/bash

# Check if cbatticon is already running
if ! pgrep -x "cbatticon" > /dev/null
then
    cbatticon &
fi

