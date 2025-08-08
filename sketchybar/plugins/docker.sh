#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"
DOCKER_BIN="/usr/local/bin/docker"

running=$($DOCKER_BIN ps -q | wc -l | tr -d '[:space:]')

total=$($DOCKER_BIN ps -a -q | wc -l | tr -d '[:space:]')

sketchybar --set $NAME icon="$DOCKER_ICON" label="${running}"
