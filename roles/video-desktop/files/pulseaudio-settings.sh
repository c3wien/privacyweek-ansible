#!/bin/bash

# ANSIBLE MANAGED FILE

{% if pulseaudio_card  %}
echo "setting card profile {{ pulseaudio_card }} {{ pulseaudio_card_profile }}"
pactl set-card-profile "{{ pulseaudio_card }}" '{{ pulseaudio_card_profile }}'
{% else %}
# pulseaudio_card not defined, not setting profile.
{% endif %}

{% if pulseaudio_sink  %}
echo "setting {{ pulseaudio_sink }} default and volume {{ pulseaudio_sink_volume }} "
pactl set-default-sink {{ pulseaudio_sink }}
pactl set-sink-volume {{ pulseaudio_sink }} {{ pulseaudio_sink_volume }}
{% else %}
# pulseaudio_sink not defined, not setting default sink and volume.
{% endif %}
