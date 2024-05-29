#!/bin/env bash

# Terminate already running bar1 instances (optional)
# This ensures only one instance is running
killall -q polybar

# Launch bar1 and detach it from the current shell
polybar Bar1 & disown

# Optional: Add logging for troubleshooting
# echo "Polybar bar1 launched..."
