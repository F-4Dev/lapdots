#!/bin/sh
echo "[installing yay  ...]"
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "[installing dank linux]"
curl -fsSL https://install.danklinux.com | sh

echo "[installing packages ...]"
yay --noconfirm -S  $(cat /home/f4/.config/hypr/packages)
