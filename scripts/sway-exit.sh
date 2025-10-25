#!/usr/bin/env bash

# A safer script to exit sway
# It tries to close windows gracefully and spares essential background services.

# List of app_ids to spare from the kill commands.
# Added "espanso" to prevent it from being killed, which can freeze input.
EXCLUSIONS="waybar|mako|swaync|polkit-gnome-authentication-agent-1|espanso"

# Get a list of process IDs for sway windows, excluding the essential ones
PIDS=$(swaymsg -t get_tree | jq -r --arg EXCLUSIONS "$EXCLUSIONS" \
    '.. | select(.pid? and .app_id?) | select(.app_id | test($EXCLUSIONS) | not) | .pid')

# Politely ask all targeted windows to terminate
if [[ -n "$PIDS" ]]; then
    echo "Terminating PIDs: $PIDS"
    kill -TERM $PIDS 2>/dev/null
fi

# Wait a longer time for them to close gracefully
sleep 2

# Forcibly kill any remaining windows from the target list
if [[ -n "$PIDS" ]]; then
    kill -KILL $PIDS 2>/dev/null
fi

exit 0