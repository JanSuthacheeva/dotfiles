#!/bin/bash

clock=(
  script="$PLUGIN_DIR/clock.sh"
  icon.font="$FONT:Regular:19.0"
  padding_right=5
  padding_left=0
  update_freq=30
)

sketchybar --add item clock e --set clock "${clock[@]}"
