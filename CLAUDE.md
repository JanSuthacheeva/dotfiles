# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository for macOS (with Linux support). Configurations are symlinked from `~/.config/` to this repository.

## Installation

macOS:
```bash
./macos/install
```
Installs Homebrew dependencies and creates symlinks for all configurations.

Omarchy (Arch + Hyprland):
```bash
./linux/omarchy/install
```
Symlinks Neovim, Claude Code, and foot config; sets foot as the default terminal
and wires theming into Omarchy (see Omarchy section below).

## Directory Structure

- **macos/** - macOS-specific configs (aerospace, ghostty, sketchybar, zsh, p10k, borders)
- **linux/** - Linux-specific configs (arch, fedora, omarchy, zsh)
- **nvim/** - Neovim configuration (shared across platforms via symlinks)
- **claude/** - Claude Code config (settings, CLAUDE.md, commands, skills)
- **karabiner/** - Keyboard remapper configuration
- **tmux/** - Terminal multiplexer config
- **scripts/** - Utility scripts (e.g., `t` for tmux session switching with fzf)

## Omarchy (linux/omarchy/)

Design: **system theming stays Omarchy-managed and dynamic** (colors change with
`omarchy theme set`), while **Neovim, Claude Code, and foot get their behavior from
this repo**. Per app: config = symlink from dotfiles; colors = Omarchy's generated
`~/.config/omarchy/current/theme/`.

- **foot** (`linux/omarchy/foot/foot.ini`) — local settings + `include` of the
  Omarchy color file. Installer runs `omarchy default terminal foot`.
- **Neovim** — `nvim/lua/aurum/omarchy.lua` reads the active theme's `colors.toml`
  and builds a palette consumed by the existing `aurum` highlight groups, so colors
  follow Omarchy. Falls back to the static slate palette when no Omarchy theme file
  exists. `init.lua` picks `background` dark/light from bg luminance.
- **Claude Code** — `linux/omarchy/omarchy/themed/claude.json.tpl` is rendered by
  Omarchy's template engine into `current/theme/claude.json` on each theme switch;
  `~/.claude/themes/omarchy.json` symlinks to it and settings use `custom:omarchy`.
- **tmux** — keybindings/behavior from `tmux/tmux.conf`; the catppuccin `@thm_*`
  palette is sourced from `current/theme/tmux.conf` (rendered from
  `linux/omarchy/omarchy/themed/tmux.conf.tpl`), so the status line follows Omarchy.
- **Hook** (`linux/omarchy/omarchy/hooks/theme-set`) — on theme change, live-reloads
  running Neovim instances, sets the Claude theme `base` (dark/light) from luminance,
  and re-sources the tmux palette into running servers.

## Key Configurations

### Neovim (nvim/)
- Uses vim.pack native package manager (not lazy.nvim)
- Plugin declarations in `plugin/+plugins.lua`
- LSP enabled in `plugin/lsp.lua` (native `vim.lsp.enable`); servers auto-install via
  `mason-lspconfig` `ensure_installed`. `sourcekit` is excluded (ships with the Swift
  toolchain, not Mason); `gopls` needs a Go toolchain present to install.
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
