
ram=(
  update_freq=10
  label.font="$FONT:Black:12.0"
  icon=$MEMORY
  script="$PLUGIN_DIR/ram.sh"
  )


sketchybar --add item ram right \
           --set ram "${ram[@]}"
