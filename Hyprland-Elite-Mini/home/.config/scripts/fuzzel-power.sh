#!/usr/bin/env bash

options="Shutdown\nReboot\nLogout\nSuspend\n\\nUEFI Setup"

# Run Fuzzel and capture selection
selection=$(echo -e "$options" | fuzzel --dmenu --config=.config/fuzzel/fuzzel-power.ini --hide-prompt)

case $selection in
    *Shutdown) systemctl poweroff -i ;;
    *Reboot) systemctl reboot -i ;;
    *Logout) hyprctl dispatch exit exit ;; 
    *Suspend) systemctl suspend ;;
    *"UEFI Setup") systemctl reboot --firmware-setup ;;
esac
