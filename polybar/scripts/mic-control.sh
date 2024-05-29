#!/bin/bash

onColor="%{F#78a090}" # #78a090 Green
offColor="%{F#D08770}" # #D08770 Red

default_mic=$(pactl get-default-source)
mic_muted=$(pactl get-source-mute "$default_mic" | awk '{print $2}')

if [ $# -eq 0 ]; then
  # current_default=$(pactl info | grep -i "default source" | cut -f2 -d':' | tr -d ' ')
  # echo "Default: $current_default"
  color="$onColor  "
  if [ "$mic_muted" = "yes" ]; then
    color="$offColor  "
  fi
  echo "$color"
fi

if [ "$1" = "toggle" ]; then
  mute=0
  if [ "$mic_muted" = "no" ]; then
    mute=1
    aplay ~/.config/polybar/scripts/mic-effects-down.wav &
  else
    aplay ~/.config/polybar/scripts/mic-effects-up.wav &
  fi
  pactl set-source-mute "$default_mic" "$mute"
fi
