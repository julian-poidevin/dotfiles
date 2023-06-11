#!/bin/bash

# Kill already running process
_ps=(swaybg swayidle waybar dunst xdg-desktop-portal-hyprland xdg-desktop-portal xfce-polkit blueman-applet)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Autostart Programs
## Swayidle (lock after 10 minutes, turn off screen after 20 minutes)
swayidle -w \
      timeout 600 'swaylock' &
# timeout 1200 ' hyprctl dispatch dpms off' \
#         resume ' hyprctl dispatch dpms on'  \
# before-sleep 'swaylock' &

## Waybar
exec waybar &
## Notification 
exec dunst &
## Wallpaper
exec swaybg -o \* -i ~/.config/hypr/wallpapers/tokyo-night-5.jpg -m fill &
## Bluetooth (Make sure you have installed blueman + blueman-utils)
exec blueman-applet &

# Screen Sharing 
exec systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
sleep 1 
exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/libexec/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &

