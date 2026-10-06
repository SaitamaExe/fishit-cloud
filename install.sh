#!/usr/bin/env bash

set -e

echo "======================================"
echo " INSTALLING CLOUD DESKTOP"
echo "======================================"

sudo apt-get update

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xfce4-terminal \
    dbus-x11 \
    xvfb \
    x11vnc \
    novnc \
    websockify \
    wget \
    curl \
    git \
    unzip \
    nano \
    htop \
    procps

chmod +x start.sh
chmod +x stop.sh

echo ""
echo "======================================"
echo " INSTALLATION COMPLETE"
echo "======================================"
echo ""
echo "Jalankan:"
echo ""
echo "./start.sh"
echo ""
