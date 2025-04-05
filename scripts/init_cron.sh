#!/bin/bash
crontab -l > mycron
echo "1 * * * * sh ~/dotfiles/scripts/unsplash_wallpaper.sh" >> mycron
echo "1 * * * * sh ~/dotfiles/scripts/change_wallpaper.sh" >> mycron
echo "" >> mycron
crontab mycron
rm mycron
