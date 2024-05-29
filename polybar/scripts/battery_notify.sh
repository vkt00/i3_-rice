#!/bin/bash

# Get battery status
battery_status=$(acpi -b)

# Check if battery is discharging and level is <= 15%
if [[ $battery_status == *"Discharging"* && $battery_status == *"[0-9][0-9]"* ]]; then
    battery_level=$(echo $battery_status | grep -o "[0-9][0-9]")
    if [ $battery_level -le 15 ]; then
        notify-send "Battery Low" "Battery level is at $battery_level%"
    fi
fi
