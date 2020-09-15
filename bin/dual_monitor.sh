#!/bin/bash

# set up the two monitors for bspwm
# NOTE This is a simplistic approach because I already know the settings I
# want to apply.
external_monitor=$(xrandr --query | grep 'HDMI1')
if [[ ! $external_monitor = *disconnected* ]]; then
    echo "Monitor conectado"
    xrandr --output eDP1 --primary --mode 1366x768 --rotate normal --output HDMI1 --mode 1600x900 --rotate normal --above eDP1
    bspc monitor HDMI1 -g 1600x900+0+0 
else
    echo "Monitor desconectado"
    xrandr --output eDP1 --primary --mode 1366x768 --rotate normal --output HDMI1 --off
fi