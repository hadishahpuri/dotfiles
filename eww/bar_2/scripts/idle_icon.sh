#!/bin/bash

swayidle_pid=$(pgrep swayidle)
if [[ -z "${swayidle_pid}" ]]; then
	eww update revealNotify=true
else
    eww update revealNotify=true
fi
