#!/bin/bash
rand=$(shuf -i1-9 -n1)
fileName=~/Pictures/wallhaven_wallpaper.jpg
url=$(proxychains curl 'https://wallhaven.cc/api/v1/search?categories=anime(0)' | jq -r ".data[$rand].path")
echo $url
$(proxychains wget -O $fileName $url)
