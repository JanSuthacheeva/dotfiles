#!/bin/bash

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

docker=(
  script="$PLUGIN_DIR/docker.sh"
  icon.font="$FONT:Regular:19.0"
  padding_right=5
  padding_left=0
  update_freq=20
  popup.align=right
  click_script="$POPUP_CLICK_SCRIPT"
)

sketchybar --add item docker right      \
           --set docker "${docker[@]}" \
           --subscribe docker
