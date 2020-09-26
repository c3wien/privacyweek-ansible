#!/bin/bash

# set link resolution
for VAR in "$(xrandr | egrep "^HDMI.* connected" | awk '{print $1}')"; do
	echo "setting output $VAR"
	xrandr --output $VAR --mode {{ desktop_resolution_mode }} --rate {{ desktop_resolution_rate }}
done

# disable link sleep
xset -dpms
xset s 0 0
