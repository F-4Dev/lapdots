#!/bin/sh
get_current_monitor() {
	hyprctl activeworkspace -j | jq -r '.monitor'
}

get_secondary_monitor() {
	hyprctl monitors -j | jq -r '.[1].name'
}

current_monitor=$(get_current_monitor)
secondary_monitor=$(get_secondary_monitor)

if [[ "$current_monitor" == "eDP-1" ]]; then
	hyprctl dispatch movetoworkspace "$1"
elif [[ "$current_monitor" == "$secondary_monitor" ]]; then
	hyprctl dispatch movetoworkspace "$(($1 + 10))"
fi
