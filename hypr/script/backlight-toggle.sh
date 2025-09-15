#!/bin/bash

# Adjust the keyboard device name as necessary
DEVICE="kbd_backlight"

# Get current brightness
current=$(brightnessctl -d "$DEVICE" get)
max=10%

# Toggle: if brightness > 0, turn off; else set to max
if [ "$current" -gt 0 ]; then
    brightnessctl -d "$DEVICE" set 0
else
    brightnessctl -d "$DEVICE" set "$max"
fi

