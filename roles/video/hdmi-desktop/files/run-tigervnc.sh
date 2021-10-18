#!/bin/sh

if [ -z "$DISPLAY" ]; then
	echo "display is not set, you have to run this from a desktop session"
	exit 1
fi

{% if desktop_vnc_password != '' %}
SECTYPES="-PasswordFile /home/{{desktop_username}}/.vnc/passwd"
{% else %}
SECTYPES="-SecurityTypes None,TLSNone"
{% endif %}
{% if desktop_extend_virtual %}
GEOMETRY="-Geometry {{ desktop_resolution_mode }} "
{% endif %}
while sleep 1; do
	echo "staring server.."
	x0tigervncserver ${GEOMETRY} ${SECTYPES}
done
