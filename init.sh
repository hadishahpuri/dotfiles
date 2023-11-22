#!/bin/bash

# Fish
sudo pacman -S \
    fish
rm ~/.config/fish/functions -rf 2>&1 /dev/null
rm ~/.config/fish/completions -rf 2>&1 /dev/null
rm ~/.config/fish/config.fish 2>&1 /dev/null
ln -s ${PWD}/fish/completions ~/.config/fish/completions
ln -s ${PWD}/fish/functions ~/.config/fish/functions
ln -s ${PWD}/fish/config.fish ~/.config/fish/config.fish

# NVim
sudo pacman -S \
    neovim \
    bat \
    ripgrep \
    noto-fonts-emoji \
    fzf \
    nodejs \
    npm

# Lunarvim
echo "Y N N" | ./lunarvim_install.sh
# Add lvim to path
./bashrc.sh
rm ~/.config/lvim/ -rf 2>&1 /dev/null
mkdir -p ~/.config/lvim/lua/user
ln -s ${PWD}/lvim/config.lua ~/.config/lvim/config.lua
ln -s ${PWD}/lvim/lv-settings.lua ~/.config/lvim/lv-settings.lua
ln -s ${PWD}/lvim/lua/user/plugins.lua ~/.config/lvim/lua/user/plugins.lua

# Starship
sudo pacman -S \
    starship
# rm ~/.config/starship.toml 2>&1 /dev/null
# ln -s ${PWD}/starship.toml ~/.config/starship.toml

# Wezterm
sudo pacman -S \
    wezterm
rm ~/.wezterm.lua 2>&1 /dev/null
ln -s ${PWD}/wezterm/wezterm.lua ~/.wezterm.lua

# Filemanager
# sudo pacman -S \
#     nautilus \
#     ranger
# rm ~/.config/ranger/ranger.conf 2>&1 /dev/null
# mkdir ~/.config/ranger -p
# ln -s ${PWD}/ranger.conf ~/.config/ranger/ranger.conf

# WM
sudo pacman -S \
    wl-clipboard \
    rofi \
    highlight \
    swappy \
    grim \
    slurp \
    swaybg \
    swayidle \
    xdg-desktop-portal-wlr \
    hyprpaper \
    hyprland \
    htop

yay -Sy \
    swaylock-effects-git \
    google-chrome \
    cronie \
    swaync

# Hyprland
rm -rf ~/.config/hypr/hyprland.conf 2>&1 /dev/null
rm -rf ~/.config/hypr/hyprpaper.conf 2>&1 /dev/null
mkdir -p ~/.config/hypr
ln -s ${PWD}/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -s ${PWD}/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

# Bar
sudo pacman -S \
    waybar \
    pavucontrol
rm -rf ~/.config/waybar 2>&1 /dev/null
ln -s ${PWD}/waybar ~/.config/waybar

# Swaylock
rm -rf ~/.config/swaylock/config 2>&1 /dev/null
ln -s ${PWD}/swaylock/config ~/.config/swaylock/config

# Swayidle
rm -rf ~/.config/swayidle/config 2>&1 /dev/null
ln -s ${PWD}/swayidle/config ~/.config/swayidle/config

# Rofi
rm -rf ~/.config/rofi/*
ln -s ${PWD}/rofi/applets ~/.config/rofi/
ln -s ${PWD}/rofi/colors ~/.config/rofi/
ln -s ${PWD}/rofi/config.rasi ~/.config/rofi/
ln -s ${PWD}/rofi/images ~/.config/rofi/
ln -s ${PWD}/rofi/launchers ~/.config/rofi/
ln -s ${PWD}/rofi/powermenu ~/.config/rofi/
ln -s ${PWD}/rofi/scripts ~/.config/rofi/

# Fonts
# https://github.com/rastikerdar/vazir-code-font/releases
# https://www.nerdfonts.com/font-downloads > Symbols Nerd Font
rm -rf ~/.fonts 2>&1 /dev/null
ln -s ${PWD}/fonts ~/.fonts

# Services
sudo pacman -S \
    gnome-keyring
mkdir ~/.config/systemd -p
ln -s ${PWD}/services/* ~/.config/systemd/user
systemctl daemon-reload --user
systemctl enable --now --user gnome-keyring-daemon

# CRON setup
crontab -l > mycron
echo "1 * * * * sh ~/dotfiles/bing_wallpaper.sh" >> mycron
echo "" >> mycron
crontab mycron
rm mycron
