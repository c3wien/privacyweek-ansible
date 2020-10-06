#!/bin/sh

if [ -z "$DISPLAY" ]; then
	echo "display is not set, you have to run this from a desktop session"
	exit 1
fi

# quick hack, let's make a systemd unit out of this
/usr/share/novnc/utils/launch.sh --vnc "localhost:5900" --listen {{ desktop_novnc_port }} &

while sleep 1; do
	echo "staring server.."
	x0tigervncserver -PasswordFile /home/debian/.vnc/passwd
done

