#!/usr/bin/env bash

set -e

DISPLAY_NUM=":1"
DISPLAY_PORT="5901"
NOVNC_PORT="6080"

echo "======================================"
echo " STARTING CLOUD DESKTOP"
echo "======================================"

pkill -f "Xvfb :1" 2>/dev/null || true
pkill -f "x11vnc.*5901" 2>/dev/null || true
pkill -f "websockify.*6080" 2>/dev/null || true

sleep 2

export DISPLAY=$DISPLAY_NUM

echo "[1/4] Starting Xvfb..."

Xvfb $DISPLAY_NUM \
    -screen 0 1280x720x24 \
    -ac \
    +extension GLX \
    +render \
    -noreset \
    > /tmp/xvfb.log 2>&1 &

sleep 3

echo "[2/4] Starting XFCE..."

dbus-launch --exit-with-session \
    startxfce4 \
    > /tmp/xfce.log 2>&1 &

sleep 5

echo "[3/4] Starting VNC..."

x11vnc \
    -display $DISPLAY_NUM \
    -rfbport $DISPLAY_PORT \
    -localhost \
    -nopw \
    -forever \
    -shared \
    -noxdamage \
    > /tmp/x11vnc.log 2>&1 &

sleep 3

echo "[4/4] Starting noVNC..."

websockify \
    --web=/usr/share/novnc \
    0.0.0.0:$NOVNC_PORT \
    localhost:$DISPLAY_PORT \
    > /tmp/novnc.log 2>&1 &

sleep 3

echo ""
echo "======================================"
echo " CLOUD DESKTOP BERHASIL"
echo "======================================"
echo ""
echo "Port: 6080"
echo ""
echo "Buka tab PORTS."
echo "Kemudian buka port 6080 di browser."
echo ""
echo "======================================"
