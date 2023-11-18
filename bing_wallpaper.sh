#!/bin/bash
url=$(curl 'http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US' | jq -r '.images[0].url')
url="https://bing.com$url"
echo $url
wget -O ~/Pictures/bing_wallpaper.jpg $url
