#!/usr/bin/env bash

# Region screenshot -> satty annotation, restoring any pre-existing fullscreen.
#
# satty runs fullscreen (via the for_window rule in 10-env-and-agents.conf) so its
# window can draw above a fullscreen game. But taking the fullscreen slot
# un-fullscreens whatever held it, and sway does NOT restore that window when satty
# exits. So: record the fullscreen window(s) before satty opens, then re-fullscreen
# them afterward. Re-enabling fullscreen on a window that never lost it is a no-op,
# so restoring every captured window is safe on multi-monitor too.

# con_ids of the application windows currently fullscreen (empty if none). Leaf
# windows carry a pid; workspace/output nodes do not, which filters those out.
FS_IDS=$(swaymsg -t get_tree | jq -r '.. | objects | select(.pid? and .fullscreen_mode == 1) | .id')

# slurp (layer-shell, already above fullscreen) selects the region; grim captures
# it; satty annotates. Blocks until satty exits.
grim -g "$(slurp)" - | satty -f - \
    --default-fill-shapes \
    --copy-command wl-copy \
    --output-filename ~/Pictures/%Y%m%d_%Hh%Mm%Ss_satty.png

# Restore fullscreen on whatever satty displaced.
if [[ -n "$FS_IDS" ]]; then
    for id in $FS_IDS; do
        swaymsg "[con_id=$id] fullscreen enable"
    done
fi
