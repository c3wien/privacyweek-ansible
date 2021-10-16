#!/bin/sh

if [ -z "$DISPLAY" ]; then
	echo "display is not set, you have to run this from a desktop session"
	exit 1
fi
while sleep 1; do
	echo "staring server.."
{% if desktop_vnc_password != '' %}
	x0tigervncserver -Geometry {{ desktop_resolution_mode }} -PasswordFile /home/{{desktop_username}}/.vnc/passwd
{% else %}
	x0tigervncserver -Geometry {{ desktop_resolution_mode }} -SecurityTypes None,TLSNone
{% endif %}
done
