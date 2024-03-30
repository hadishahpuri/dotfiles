#!/bin/sh
COMMAND=$(xset -q | grep LED | awk '{ print $10 }')

case "$COMMAND" in

 "00000000"|"00000002") LAYOUT="EN" ;;

 "00001000"|"00001002") LAYOUT="FA" ;;

  *) LAYOUT="??" ;;

esac

echo $LAYOUT
