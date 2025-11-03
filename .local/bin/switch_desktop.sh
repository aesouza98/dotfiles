#!/bin/bash

# Define DE packages
GNOME_PKGS=("gnome" "gdm")
PLASMA_PKGS=("plasma-meta" "konsole" "kate" "dolphin" "ark" "plasma-workspace" "sddm")

# Detect current DE
if pgrep -x "gnome-shell" > /dev/null; then
    CURRENT_DE="GNOME"
elif pgrep -x "plasmashell" > /dev/null; then
    CURRENT_DE="PLASMA"
else
    echo "Could not detect current Desktop Environment (GNOME or Plasma)."
    exit 1
fi

echo "Current DE detected: $CURRENT_DE"

# Set target DE and packages
if [[ "$CURRENT_DE" == "GNOME" ]]; then
    TARGET_DE="PLASMA"
    TARGET_PKGS=("${PLASMA_PKGS[@]}")
    CURRENT_PKGS=("${GNOME_PKGS[@]}")
    DEFAULT_DM="sddm"
else
    TARGET_DE="GNOME"
    TARGET_PKGS=("${GNOME_PKGS[@]}")
    CURRENT_PKGS=("${PLASMA_PKGS[@]}")
    DEFAULT_DM="gdm"
fi

# Ask user about switching
read -p "Do you want to switch to $TARGET_DE? (y/N): " SWITCH_CONFIRM
[[ "$SWITCH_CONFIRM" != "y" && "$SWITCH_CONFIRM" != "Y" ]] && echo "Aborted." && exit 0

# Ask user about uninstalling current DE
read -p "Do you want to uninstall $CURRENT_DE before installing $TARGET_DE? (y/N): " REMOVE_CURRENT

if [[ "$REMOVE_CURRENT" == "y" || "$REMOVE_CURRENT" == "Y" ]]; then
    echo "Removing current DE ($CURRENT_DE)..."
    sudo pacman -Runs "${CURRENT_PKGS[@]}"
else
    echo "Installing $TARGET_DE over current DE..."
fi

# Install new DE
echo "Installing $TARGET_DE..."
sudo pacman -S --needed "${TARGET_PKGS[@]}"

# Set Display Manager
if [[ "$REMOVE_CURRENT" == "y" || "$REMOVE_CURRENT" == "Y" ]]; then
    NEW_DM="$DEFAULT_DM"
else
    echo "Which Display Manager do you want to use?"
    select dm in gdm sddm; do
        case $dm in
            gdm|sddm) NEW_DM="$dm"; break ;;
            *) echo "Invalid choice";;
        esac
    done
fi

# Disable both DMs first
echo "Disabling existing display managers..."
sudo systemctl disable gdm.service sddm.service

# Enable the chosen DM
echo "Enabling $NEW_DM..."
sudo systemctl enable "$NEW_DM.service"

echo "Done. Please reboot to start $TARGET_DE with $NEW_DM."

