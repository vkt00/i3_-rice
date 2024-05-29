#!/bin/bash

# Define the path to your plain Rofi theme file
theme_file="/home/Odin/.config/rofi2/applets/type-1/style-3.rasi"

# Check if the theme file exists
if [[ ! -f "$theme_file" ]]; then
    echo "Error: Theme file not found!"
    exit 1
fi

# Get a list of available audio devices
audio_devices=$(pactl list sinks | awk '/Name: /{print $2}' | cut -c 2- | rev | cut -c 2- | rev)

# Use Rofi to display the menu and select an audio device
selected_device=$(echo "$audio_devices" | rofi -dmenu -p "Select Audio Device:" -theme "$theme_file")

# Switch audio output to the selected device
pactl set-default-sink "$selected_device"

