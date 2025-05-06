#!/bin/bash
echo "Installing python and pip..."
apt-get update
apt-get install -y python3 python3-pip ffmpeg

echo "Installing yt-dlp..."
pip3 install yt-dlp

echo "Adding /usr/local/bin to PATH..."
export PATH=$PATH:/usr/local/bin
echo "PATH is now: $PATH"

echo "Checking yt-dlp installation..."
which yt-dlp || echo "yt-dlp not found in PATH"
/usr/local/bin/yt-dlp --version

# Create a symbolic link to make yt-dlp available in /usr/bin
echo "Creating symbolic link for yt-dlp..."
ln -sf /usr/local/bin/yt-dlp /usr/bin/yt-dlp

# Make yt-dlp available for the Node.js process
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.profile
echo 'export PATH=$PATH:/usr/local/bin' >> /etc/environment

echo "Dependencies installed successfully!"