#!/usr/bin/env bash

echo "Stopping Cloud Desktop..."

pkill -f "Xvfb :1" 2>/dev/null || true
pkill -f "x11vnc.*5901" 2>/dev/null || true
pkill -f "websockify.*6080" 2>/dev/null || true
pkill -f "xfce4-session" 2>/dev/null || true
pkill -f "xfdesktop" 2>/dev/null || true
pkill -f "xfwm4" 2>/dev/null || true

echo "Cloud Desktop stopped."
