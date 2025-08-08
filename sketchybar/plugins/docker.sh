#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"
DOCKER_BIN="/usr/local/bin/docker"


# Check if Docker is available
if ! $DOCKER_BIN info >/dev/null 2>&1; then
  sketchybar --set $NAME icon="$DOCKER_ICON"

  docker_tooltip=(
      padding_right=5
    )

  sketchybar --add item docker.tooltip popup.docker  \
             --set docker.tooltip "${docker_tooltip[@]}" label="Docker not Running"
  exit 0
else

  # Get container list
  containers=$($DOCKER_BIN ps --format '{{.Names}} ({{.Image}})' | sed '/^$/d')

  running=$($DOCKER_BIN ps -q | wc -l | tr -d '[:space:]')
  
  total=$($DOCKER_BIN ps -a -q | wc -l | tr -d '[:space:]')
  
  sketchybar --set $NAME icon="$DOCKER_ICON" label="${running}"

  sketchybar --add item docker.tooltip popup.docker  \
  # Update popup content
  if [ -z "$containers" ]; then
    sketchybar --remove '/docker.tooltip\..*/'
    sketchybar --set docker.tooltip label="No running containers"
  else
    # Clear old popup items
    sketchybar --remove '/docker.tooltip\..*/'
  
    index=0
    while IFS= read -r container; do
      item_id="docker.tooltip.$index"
      sketchybar --add item "$item_id" popup.docker \
                 --set "$item_id" label="$container" icon.drawing=off padding_left=10 padding_right=10
      index=$((index+1))
    done <<< "$containers"
  fi

fi

