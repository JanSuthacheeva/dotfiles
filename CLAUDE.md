# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS (with Linux support). Configurations are symlinked from `~/.config/` to this repository.

## Installation

Run the macOS install script:
```bash
./macos/install
```

This script installs Homebrew dependencies and creates symlinks for all configurations.

## Directory Structure

- **macos/** - macOS-specific configs (aerospace, ghostty, sketchybar, zsh, p10k, borders)
- **linux/** - Linux-specific configs (ghostty)
- **nvim/** - Neovim configuration (shared via symlinks in macos/nvim and linux/nvim)
- **karabiner/** - Keyboard remapper configuration
- **tmux/** - Terminal multiplexer config
- **scripts/** - Utility scripts (e.g., `t` for tmux session switching with fzf)

## Key Configurations

### Neovim (nvim/)
- Uses vim.pack native package manager (not lazy.nvim)
- Plugin declarations in `plugin/+plugins.lua`
- LSP configured for: lua, PHP (intelephense), Python, TypeScript, Go, Swift, HTML, Tailwind
- Leader key: Space
- TreeSitter parsers: blade, css, go, html, lua, php, python, swift, sql

### Sketchybar (macos/sketchybar/)
- Lua-based modular configuration
- Entry point: `init.lua`, bootstrap: `sketchybarrc`
- Items in `items/` directory, widgets in `items/widgets/`
- Integrates with AeroSpace via workspace change events

### AeroSpace (macos/aerospace/)
- Tiling window manager config in TOML
- Starts sketchybar and borders on launch
- Triggers sketchybar updates on workspace changes

### Zsh (macos/zsh/)
- Oh-my-zsh with Powerlevel10k theme
- Key aliases: `gs/ga/gaa/gc/glg` (git), `pa/sa` (PHP artisan/sail)

## Integration Points

- AeroSpace startup → launches sketchybar and borders
- Workspace changes → trigger sketchybar bar updates via exec-on-workspace-change
- Tmux session script (`scripts/t`) → searches ~/projects for fzf-based session switching
