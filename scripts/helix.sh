#!/bin/sh
command="$1"
param="$2"
filename=$(echo "$param" | sed "s#~#$HOME#" | sed "s#\(^[^/]\)#$PWD/\\1#")
basedir=$(dirname "$filename")
line="$3"
col="$4"

case "$command" in
    "getfileinfo")
        sleep 0.1
        zellij action dump-screen /tmp/zdump
        cat /tmp/zdump | rg -e "(?:NOR|INS|SEL)[ \t]+([^\s]+)[ \t]+[a-z.-]+[ \t]+\d+[ \t]+\d+[ \t]+[a-z.-]+[ \t]+\d+[ \t]+[a-z.-]+[ \t]+(\d+):(\d+)" -o --replace '$1 $2 $3'
        rm /tmp/zdump
        ;;
    "copy")
        echo $param | cliphist store
        ;;
    "blame")
        zellij run -f -c --name Blame -- tig blame +$line -- $filename
        ;;
    "git")
        zellij run -f -c --name LazyGit -- lazygit
        ;;
    "explorer")
        zellij run -c -f --name FileManager -- sh -c "HELIX=1 yazi \"$basedir\""
        ;;

    "edit")
        zellij action toggle-floating-panes
        zellij action write 27
        zellij action write-chars ":open $param"
        zellij action write 13
        zellij action toggle-floating-panes
        zellij action write-chars "q"
esac
