#!/bin/sh
echo "welcome back :)"

echo "[installing prequesits  ...]"
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "[installing dank linux]"
curl -fsSL https://install.danklinux.com | sh

echo "[cloning repo ...]"
git clone https://github.com/F-4Dev/lapdots.git tmp && cd tmp

echo "[installing packages ...]"
yay --noconfirm -S  $(cat packages)

echo "[zsh ...]"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

echo "[enabling hyprexpo ...]"
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo
hyprpm reload

echo "[moving files ...]"
cp hyprland.conf ~/.config/hypr/hyprland.conf
cp dms/binds.conf ~/.config/hypr/dms/binds.conf
cp .zshrc ~/.zshrc
cp .gitignore ~/.config/hypr/.gitignore
cp VSCodium/* .config/VSCodium/User/
mkdir -p Pictures/wallpaper && mv wallpaper/* Pictures/wallpaper/

echo "[system will now reboot, until we meet again :) ]"
sleep 1
echo "1\
sleep 1
echo "2\
sleep 1
echo "3\
sleep 1
sudo reboot now
