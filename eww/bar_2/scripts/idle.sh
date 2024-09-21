#!/bin/bash

swayidle_pid=$(pgrep swayidle)
eww="eww -c $HOME/.config/eww/bar_2"

if [[ -z "${swayidle_pid}" ]]; then
    $eww update IDLE="images/icons/idle-on-icon.png"
	swayidle -w 2>/dev/null >/dev/null
else
    $eww update IDLE="images/icons/idle-off-icon.png"
    killall swayidle 2>/dev/null >/dev/null
fi
