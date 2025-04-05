#!/bin/bash
rand=$(shuf -i1-9 -n1)
dir=~/Pictures
fileName="unsplash_wallpaper_$rand.jpg"
images=$(curl "https://api.unsplash.com/search/photos?client_id=nC-nVt4B1sPH-agd6928lGMtjwHLGfHAWFjoHPw4e-Y&per_page=10&query=wallpaper&orientation=landscape")
image=$(echo $images | jq -r ".results[$rand].urls.full")
$(rm -rf $dir/$fileName)
$(aria2c --continue=true -d $dir -o $fileName $image)
