#!/bin/bash

# One positional argument: blur radius (default to 2).
# Higher values mean stronger blur.
RADIUS=0x${1:-2}

# Take a screenshot and blur it
import -silent -window root png:- | \
    convert - -scale 20% -blur $RADIUS -resize 500% /tmp/screenshot.png
i3lock -i /tmp/screenshot.png
exit 0
