#!/bin/bash

# Get the monitor name
monitor=$(xrandr --listmonitors | awk 'NR==2{print $4}')

# Calculate the Polybar width (adjust this value as needed)
screen_width=$(xrandr | grep "$monitor" -A1 | tail -n 1 | awk '{print $1}')
polybar_width=$((screen_width - 100))  # Adjust the 100 as needed

# Output the monitor name and Polybar width
echo "Monitor: $monitor"
echo "Polybar Width: $polybar_width"
