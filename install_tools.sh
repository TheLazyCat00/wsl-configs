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

echo "Installing tools"
brew install neovim
brew install fzf
brew install composer
brew install fd
brew install gh
brew install lazygit
brew install ripgrep
brew install unzip
brew install sqlite3
brew install oh-my-posh

echo "Installing languages"
brew install cmake
brew install go
brew install julia
brew install lua
brew install luarocks
brew install node
brew install openjdk
brew install python3
brew install ruby
brew install rust
