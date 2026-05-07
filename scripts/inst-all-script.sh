#!/bin/sh
echo "welcome back :)"

echo "\\n[installing prequesits  ...]"
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && \

echo "\\n[installing dank linux]"
curl -fsSL https://install.danklinux.com | sh

echo "\\n[cloning repo ...]"
git clone https://github.com/F-4Dev/lapdots.git tmp && cd tmp

echo "\\n[installing packages ...]"
yay --noconfirm -S  $(cat packages)

echo "\\n[zsh ...]"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

echo "\\n[enabling hyprexpo ...]"
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo
hyprpm reload

echo "\\n[moving files ...]"
cp hyprland.conf ~/.config/hypr/hyprland.conf
cp dms/binds.conf ~/.config/hypr/dms/binds.conf
cp .zshrc ~/.zshrc
cp .gitignore ~/.config/hypr/.gitignore
cp VSCodium/* .config/VSCodium/User/
mkdir -p Pictures/wallpaper && mv wallpaper/* Pictures/wallpaper/

echo "\\n[system will now reboot, until we meet again :) ]"
sleep 1
echo "1\
sleep 1
echo "2\
sleep 1
echo "3\
sleep 1
sudo reboot now
