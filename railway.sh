#!/bin/bash
echo "Installing python and pip..."
apt-get update
apt-get install -y python3 python3-pip ffmpeg

echo "Installing yt-dlp..."
pip3 install yt-dlp

echo "Checking yt-dlp installation..."
yt-dlp --version

echo "Dependencies installed successfully!"