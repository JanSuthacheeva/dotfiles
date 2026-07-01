.PHONY: theme-aurum theme-spectra wallpaper

# Switch the macOS theme across ghostty, nvim, borders and wallpaper.
# Logic lives in macos/theme.
theme-aurum:
	./macos/theme aurum

theme-spectra:
	./macos/theme spectra

# Manually rotate the spectra wallpaper now (no-op unless on spectra).
wallpaper:
	./macos/wallpaper-rotate
