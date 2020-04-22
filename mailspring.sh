#!/usr/bin/env bash

# Exit on error
set -e

# Exit on error in any of pipe commands
set -o pipefail

sudo -v

# Update packages and Installs Mailspring latest version
sudo apt-get update
sudo snap install mailspring

# Verify and exit installation
MAILSPRING_CHECK="$(mailspring -v)"
if [[ "$MAILSPRING_CHECK" == *"1.7.5"* ]]; then
  echo -e "\\033[0;32m[OK]\\033[0m"
  exit 0
else
  echo -e "\\033[0;31m[FAILED]\\033[0m"
  exit 1
fi
