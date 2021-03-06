#!/bin/bash

# setupdeb.sh
# Setup DMS for Debian v1.0.0
# Michael McMahon

# setupdeb.sh installs the necessary packages to run builddatapack.sh
# on Debian based GNU/Linux distributions.

# To run, open a terminal and enter:
#   sudo bash builddatapack.sh

# Initialization checks

# Check for /bin/bash.
if [ "$BASH_VERSION" = '' ]; then
  echo "You are not using bash."
  echo "Use this syntax instead:"
  echo "sudo bash bluearchive.sh"
  exit 1
fi

# Check networking
# https://unix.stackexchange.com/questions/190513/shell-scripting-proper-way-to-
#   check-for-internet-connectivity
echo Checking network...
if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo "The network is up."
else
  echo "The network is down."
  echo "Check connection and restart script!"
  exit 1
fi

# Check for root.
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi


echo "Installing Debian dependencies..."
apt update
apt install -y python3-pip
apt install -y python3-tk
pip3 install numpy==1.15.0
pip3 install pandas==0.20.3
pip3 install matplotlib
apt install -y gpicview
apt install -y zip

echo "To configure tox, run"
echo "  bash buildtoxtestenvironment.sh"
