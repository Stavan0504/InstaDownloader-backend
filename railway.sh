#!/bin/bash

echo "Installing Node.js, npm, python3, pip, and ffmpeg..."

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get update
apt-get install -y nodejs

# Check if Node.js and npm are installed
echo "Checking Node.js and npm installation..."
which node || echo "Node.js is not installed"
which npm || echo "npm is not installed"

# If node and npm are not found, reinstall them
if ! command -v node &> /dev/null || ! command -v npm &> /dev/null; then
    echo "Node.js or npm not found. Reinstalling Node.js and npm."
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
    apt-get install -y nodejs
fi

# Verify Node.js and npm versions
echo "Node.js version:"
node -v
echo "npm version:"
npm -v

# Install python and other dependencies
apt-get install -y python3 python3-pip ffmpeg

# Install yt-dlp
pip3 install yt-dlp

echo "Adding /usr/local/bin to PATH..."
export PATH=$PATH:/usr/local/bin
echo "PATH is now: $PATH"

# Check yt-dlp installation
which yt-dlp || echo "yt-dlp not found in PATH"
yt-dlp --version

# Make yt-dlp available for the Node.js process
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.profile
echo 'export PATH=$PATH:/usr/local/bin' >> /etc/environment

echo "Dependencies installed successfully!"
