#!/bin/bash

docker=(
  script="$PLUGIN_DIR/docker.sh"
  icon.font="$FONT:Regular:19.0"
  padding_right=5
  padding_left=0
  update_freq=30
)

sketchybar --add item docker right      \
           --set docker "${docker[@]}" \
