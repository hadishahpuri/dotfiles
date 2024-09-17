#!/bin/bash

swayidle_pid=$(pgrep swayidle)
if [[ -z "${swayidle_pid}" ]]; then
	swayidle -w 2>/dev/null >/dev/null
else
    killall swayidle 2>/dev/null >/dev/null
fi
