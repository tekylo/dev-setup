#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

echo -n "Installing Sublime Text Editor ..."

# Install the GPG key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Ensure apt is set up to work with https sources
sudo apt-get install apt-transport-https

# Adds the Sublime text apt PPA
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# Update packages and Installs Sublime text latest version
sudo apt-get update
sudo apt-get install sublime-text

# Verify and exit installation
SUBLIME_CHECK="$(subl -v 1>&1)"
if [[ "$SUBLIME_CHECK" == *"Sublime Text Build"* ]]; then
  echo -e "\\033[0;32m[OK]\\033[0m"
  exit 0
else
  echo -e "\\033[0;31m[FAILED]\\033[0m"
  exit 1
fi
