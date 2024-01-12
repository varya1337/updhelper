#!/bin/bash

echo "Hello! I'm here to help you update and install components on your Bomjaro Linux with best KalDE GUI."

update_system() {
    sudo pacman -Syu
}

install_programs() {
    for program in "$@"; do
        echo "Installing $program..."
        sudo pacman -S --noconfirm $program
    done
}

if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run with root privileges."
    exit 1
fi

echo "Updating the system..."
update_system

programs_to_install=("chromium" "telegram-desktop" "exodus")

install_programs "${programs_to_install[@]}"

echo "Script execution completed."
