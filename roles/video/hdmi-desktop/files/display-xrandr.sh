#!/bin/bash

# ANSIBLE MANAGED FILE

# set link resolution
for VAR in "{{ desktop_force_output | default("$(xrandr | egrep '^HDMI.* connected' | awk '{print $1}')") }}"; do
	echo "setting output $VAR"
{% if desktop_extend_virtual == true %}
	xrandr --output $VAR --mode {{ desktop_resolution_mode }} --rate {{ desktop_resolution_rate }}
	xrandr --addmode VIRTUAL1 {{ desktop_resolution_mode }}
	xrandr --output VIRTUAL1 --primary --mode {{ desktop_resolution_mode }} --rate {{ desktop_resolution_rate }} --left-of $VAR
{% else %}
	xrandr --output $VAR --mode {{ desktop_resolution_mode }} --rate {{ desktop_resolution_rate }}
{% endif %}
done

# disable link sleep
xset -dpms
xset s 0 0
