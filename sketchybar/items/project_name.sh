
project_name=(
  icon=":neovim:"
  # icon.font="Liga SFMono Nerd Font:Regular:19.0"
  icon.font="sketchybar-app-font:Regular:19.0"
  label="-"
  label.font="$FONT:Black:12.0"
  padding_right=20
)


sketchybar --add item project_name right \
           --set project_name "${project_name[@]}" \
           --subscribe project_name front_app_switched
