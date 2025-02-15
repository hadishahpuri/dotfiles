#!/bin/sh
python ~/dotfiles/scripts/wttr.py | jq -r .text
