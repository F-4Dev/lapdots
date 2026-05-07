#!/bin/sh
echo "[installing prequesits  ...]"
sudo pacman -S --needed git wget base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "[cloning repo ...]"
git clone https://github.com/F-4Dev/lapdots.git tmp && cd tmp

echo "[installing dank linux]"
curl -fsSL https://install.danklinux.com | sh

echo "[installing packages ...]"
yay --noconfirm -S  $(cat /home/f4/.config/hypr/packages)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[enabling hyprexpo ...]"
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo
hyprpm reload

echo "[moving files ...]"
cp dms/binds.conf ~/.config/hypr/dms/binds
cp .zshrc ~/.zshrc
cp hyprland.conf ~/.config/hypr/hyprland.conf
cp .gitignore ~/.config/hypr/.gitignore

echo "[system will reboot ...]"

