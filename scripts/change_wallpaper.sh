#!/bin/bash
image=$(find ~/Pictures/ -regex '.*\.\(jpg\|jpeg|png\)' | shuf -n 1)
$(swww img "$image")
