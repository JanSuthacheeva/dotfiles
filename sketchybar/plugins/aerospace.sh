# #!/usr/bin/env bash
#
# # make sure it's executable with:
# # chmod +x ~/.config/sketchybar/plugins/aerospace.sh
#
# if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     if ["$FOCUSED_WORKSPACE" = 1]; then
#         sketchybar --set $NAME background.color=0xffffffff icon.padding_right=6 icon.color=0xff000000
#     else
#         sketchybar --set $NAME background.color=0xffffffff icon.color=0xff000000
#     fi
#     # sketchybar --set $NAME background.drawing=on
# else
#     # sketchybar --set $NAME background.drawing=off
#     sketchybar --set $NAME background.color=0x00000000 icon.color=0xffa6adc8
# fi
#!/bin/bash

echo "called with $1"
echo "$FOCUSED_WORKSPACE"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi
