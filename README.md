# dotfiles

Personal dotfiles for macOS and Linux.

## Installation

**macOS:**
```bash
./macos/install
```

**Linux:**
```bash
./linux/install
```

## Structure

```
├── macos/           # macOS-specific configs
│   ├── aerospace/   # Tiling window manager
│   ├── sketchybar/  # Status bar (Lua-based)
│   ├── ghostty/     # Terminal emulator
│   ├── borders/     # Window borders
│   ├── zsh/         # Shell config
│   └── p10k/        # Powerlevel10k theme
├── linux/           # Linux-specific configs
│   └── ghostty/
├── nvim/            # Neovim (shared)
├── tmux/            # Tmux config
├── claude/          # Claude Code settings, commands, skills
├── scripts/         # Utility scripts
│   └── t            # Tmux session picker (fzf)
└── wallpapers/
```

## Key bindings

### AeroSpace (macOS)

| Key | Action |
|-----|--------|
| `cmd-{1-6}` | Switch workspace |
| `alt-shift-{1-6}` | Move window to workspace |
| `cmd-{arrows}` | Focus window |
| `cmd-shift-{arrows}` | Move window |
| `cmd-enter` | Open Ghostty |

### Tmux

Prefix: `ctrl-a`

## Dependencies

macOS install script handles Homebrew packages. Main dependencies:

- neovim
- tmux
- fzf (for scripts/t)
- ghostty
- aerospace (macOS)
- sketchybar (macOS)
