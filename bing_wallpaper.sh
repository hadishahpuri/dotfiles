#!/bin/bash
rand=$(shuf -i1-9 -n1)
fileName=~/Pictures/bing_wallpaper.jpg
url=$(proxychains curl 'http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=10&mkt=en-US' | jq -r ".images[0].url")
url="https://bing.com$url"
echo $url
$(proxychains wget -O $fileName $url)
