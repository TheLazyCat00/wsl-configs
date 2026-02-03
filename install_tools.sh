#!/usr/bin/env bash

sudo apt update
sudo apt install locales -y
# Generate en_US.UTF-8 locale
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8
sudo apt install build-essential -y
sudo apt install python3.12-venv

echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
