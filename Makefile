.PHONY: theme-aurum theme-spectra wallpaper

# Switch the macOS theme across ghostty, nvim, borders and wallpaper.
# Logic lives in macos/theme.
theme-aurum:
	./macos/theme aurum

theme-spectra:
	./macos/theme spectra

# Set the spectra wallpaper now (no-op unless on spectra).
#   make wallpaper       -> random image
#   make wallpaper rwb   -> that specific image by basename
wallpaper:
	./macos/wallpaper-rotate $(filter-out wallpaper,$(MAKECMDGOALS))

# Swallow the image-name argument so `make wallpaper rwb` doesn't treat `rwb`
# as an unknown target.
%:
	@:
