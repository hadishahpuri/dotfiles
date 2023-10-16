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

# NVim & Lunarvim
sudo pacman -S \
    neovim \
    bat \
    ripgrep \
    noto-fonts-emoji \
    fzf

# Starship
sudo pacman -S \
    starship
# rm ~/.config/starship.toml 2>&1 /dev/null
# ln -s ${PWD}/starship.toml ~/.config/starship.toml

# Wezterm
sudo pacman -S \
    wezterm
rm ~/.wezterm.lua 2>&1 /dev/null
ln -s ${PWD}/wezterm.lua ~/.wezterm.lua

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
    hyprpaper

yay -Sy \
    swaylock-effects-git \
    google-chrome

rm -rf ~/.config/hypr/hyprland.conf 2>&1 /dev/null
ln -s ${PWD}/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -s ${PWD}/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

# Bar
sudo pacman -S \
    waybar \
    pavucontrol
rm -rf ~/.config/waybar 2>&1 /dev/null
ln -s ${PWD}/waybar ~/.config/waybar

# Network manager by Rofi
# ln -s ${PWD}/networkmanager-dmenu ~/.config/networkmanager-dmenu

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
