#!/bin/bash
pcal=$HOME/.config/hypr/scripts/pcal.sh
current=$($pcal -t)
calendar=$($pcal -m)
echo "{\"text\": \""$current"\", \"class\": \"custom-shamsi\", \"tooltip\": \"$calendar\"}" | sed 's/\s*\\n\s*\\n//'
