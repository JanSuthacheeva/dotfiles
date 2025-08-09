#!/usr/bin/env bash

# Get last folder of current working directory
DIR_NAME=$(basename "$PWD")

# Update SketchyBar
sketchybar --set project_name label="$DIR_NAME"
