#!/bin/bash

# Update package list
echo "Updating package list..."
apt-get update

# Install dependencies: Python, pip, ffmpeg, Node.js, npm
echo "Installing dependencies..."
apt-get install -y python3 python3-pip ffmpeg curl

# Install Node.js and npm
echo "Installing Node.js and npm..."
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Verify Node.js and npm installation
echo "Verifying Node.js and npm installation..."
which node || echo "Node.js not found!"
which npm || echo "npm not found!"

# Check Node.js and npm versions
echo "Node.js version:"
node -v
echo "npm version:"
npm -v

# Install yt-dlp
echo "Installing yt-dlp..."
pip3 install yt-dlp

# Add /usr/local/bin to PATH to make sure yt-dlp is found
echo "Adding /usr/local/bin to PATH..."
export PATH=$PATH:/usr/local/bin

# Check if yt-dlp is available in PATH
echo "Verifying yt-dlp installation..."
which yt-dlp || echo "yt-dlp not found in PATH"

# Check yt-dlp version
yt-dlp --version

# Make sure yt-dlp is available to the Node.js process
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.profile
echo 'export PATH=$PATH:/usr/local/bin' >> /etc/environment

echo "Dependencies installed successfully!"
