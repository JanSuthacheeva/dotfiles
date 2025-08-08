#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"

running=$(docker ps -q | wc -l | tr -d '[:space:]')
total=$(docker ps -a -q | wc -l | tr -d '[:space:]')

sketchybar --set $NAME icon="$DOCKER_ICON" label="$running/$total"
