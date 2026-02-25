# NixOS Configuration - Complete Documentation

A comprehensive, modular NixOS configuration managing multiple systems with emphasis on privacy, AI-assisted development, and Wayland desktop.

---

## Table of Contents

1. [Overview](#overview)
2. [Project Structure](#project-structure)
3. [Host Configurations](#host-configurations)
4. [System Modules](#system-modules)
5. [GUI Modules](#gui-modules)
6. [CLI Modules](#cli-modules)
7. [Programming Environment](#programming-environment)
8. [Nixvim Configuration](#nixvim-configuration)
9. [Flake Architecture](#flake-architecture)
10. [Secrets Management](#secrets-management)
11. [Build Commands](#build-commands)
12. [Custom Applications](#custom-applications)
13. [Key Features](#key-features)

---

## Overview

This is a flake-based NixOS configuration that manages multiple machines from a single repository. It features:

- **Modular architecture** - Each aspect of the system is a separate, reusable module
- **Multi-host support** - Single flake manages laptop, desktop, tablet, and USB installations
- **Wayland-first** - Hyprland compositor with full touch gesture support
- **AI-integrated** - Claude Code, Agentic.nvim, aider-chat, and multiple MCP servers
- **Privacy-focused** - Multiple VPN options, covert DNS tunneling, proxy management

---

## Project Structure

```
nixos-configuration/
├── flake.nix                    # Central orchestrator, defines all systems
├── flake.lock                   # Dependency lock file
├── CLAUDE.md                    # Instructions for Claude Code
│
├── hosts/                       # Per-host configurations
│   ├── base.nix                # Base template (imports default.nix + hardware)
│   ├── new-laptop.nix          # Main laptop (TLP, keyboard remap)
│   ├── laptop.nix              # Older laptop (TLP)
│   ├── home-pc.nix             # Desktop (NVIDIA, taskchampion sync)
│   ├── tablet.nix              # KDE Plasma6 + disko partitions
│   ├── hidpi.nix               # HiDPI configuration overlay
│   ├── usb.nix                 # Full USB install + LUKS + disko
│   ├── usb-disko.nix           # Disko partition config for USB
│   ├── tablet-disko.nix        # Disko partition config for tablet
│   └── iso.nix                 # Live ISO image
│
├── default.nix                 # Top-level module aggregator
│
├── system/                     # Core system configuration
│   ├── default.nix             # System module aggregator
│   ├── userInfo.nix            # User configuration options schema
│   ├── users.nix               # User "aliz" definition
│   ├── boot.nix                # GRUB bootloader configuration
│   ├── nix.nix                 # Flakes, GC, NUR settings
│   ├── network.nix             # VPNs, proxies, ExpressVPN
│   ├── expressvpn.nix          # ExpressVPN package definition
│   ├── slipstream.nix          # Custom DNS tunnel package
│   ├── paqet.nix               # Packet-level proxy package
│   └── printing.nix            # Printing service
│
├── gui/                        # Hyprland/Wayland desktop
│   ├── default.nix             # GUI module aggregator
│   ├── hyprland-config.nix     # Hyprland WM config, keybinds, assigns
│   ├── waybar.nix              # Status bar configuration
│   ├── rofi.nix                # Application launcher
│   ├── rofi-config.rasi        # Rofi config
│   ├── rofi-theme.rasi         # Rofi theme
│   ├── firefox.nix             # Firefox settings
│   ├── media.nix               # Pipewire, Bluetooth, media apps
│   ├── alacritty-ai-theme.toml # Terminal theme
│   ├── waybar-style.css        # Waybar styling
│   ├── notitrans-fa.nix        # Translate to Persian
│   ├── notitrans-en.nix        # Translate to English
│   ├── notitrans-dict.nix      # Dictionary lookup
│   ├── search-select.nix       # Search selection in Firefox
│   └── ensure-class-hyprland.nix # Force window class
│
├── cli/                        # Command-line tools
│   ├── default.nix             # CLI module aggregator
│   ├── alert.nix               # Telegram notification script
│   ├── uri-short.nix           # URL shortcut creator
│   └── pgbkp/                  # PostgreSQL backup tool
│       ├── default.nix
│       └── script.sh
│
├── programming/                # Development environment
│   ├── default.nix             # Programming module aggregator
│   ├── editors.nix             # Neovim, nixvim
│   ├── virtualisation.nix      # Docker, libvirt
│   ├── aider-ce/               # Aider AI assistant package
│   │   ├── package.nix
│   │   ├── fix-flake8-invoke.patch
│   │   └── fix-tree-sitter.patch
│   └── nixvim/                 # Modular Neovim config
│       ├── default.nix         # Module list
│       ├── options.nix         # Basic Neovim options
│       ├── lsp.nix             # LSP, completion, keybinds
│       ├── telescope.nix       # Fuzzy finder
│       ├── ai.nix              # AI plugins (agentic, avante)
│       ├── terminal.nix        # Toggleterm
│       ├── ui.nix              # UI plugins (lualine, neo-tree)
│       ├── navigation.nix      # Smart splits, cybu
│       ├── gitsigns.nix        # Git integration
│       ├── comment.nix         # Comment plugin
│       └── treesitter.nix      # Treesitter config
│
└── vars/                       # Gitignored variables
    ├── hardware-configuration.nix  # Hardware-specific config
    └── secrets.ehsan.nix          # User secrets (gitignored)
```

---

## Host Configurations

### Host Definitions

| Host | Description | Special Features |
|------|-------------|------------------|
| `nixos-new-laptop` | Main laptop | TLP power management, udev keyboard remap (Alt→Shift) |
| `nixos-laptop` | Older laptop | TLP power management |
| `nixos-home-desktop` | Desktop | NVIDIA open-source drivers, taskchampion sync server, HiDPI |
| `tablet` | Tablet | KDE Plasma6 (not Hyprland), disko partitions |
| `usb` | USB installation | LUKS encryption, disko partitions |
| `iso` | Live image | Squashfs-based ISO |

### Host Configuration Pattern

Each host imports `base.nix` which imports `default.nix` (all modules) and `hardware-configuration`:

```nix
# hosts/new-laptop.nix
{ pkgs, config, ... }:
{
  imports = [
    ./base.nix
  ];
  networking.hostName = "nixos-new-laptop";

  # Host-specific configuration...
}
```

---

## System Modules

### Module: `system/userInfo.nix`

Defines the comprehensive user configuration schema. All options are accessible via `config.userConfiguration`.

```nix
{
  options.userConfiguration = {
    name = lib.mkOption { ... };      # Username
    fullName = lib.mkOption { ... };   # Full name
    email = lib.mkOption { ... };      # Email
    secrets = { ... };                 # Secrets attrset
  };
}
```

**Secrets Schema:**

| Key | Purpose |
|-----|---------|
| `HASHED_PASSWORD` | User password hash |
| `proxies` | Shell scripts for different proxies |
| `defaultProxy` | Default proxy name |
| `OPENAI_API_KEY`, `GROQ_API_KEY`, `OPENROUTER_API_KEY` | AI API keys |
| `OPENAI_API_HOST` | API host override |
| `location` | `{latitude, longitude}` for redshift |
| `taskwarrior-secret` | Task sync encryption |
| `NOTIFIER_BOT_TOKEN`, `CHAT_ID` | Telegram notifications |
| `ANTHROPIC_AUTH_TOKEN`, `ANTHROPIC_BASE_URL` | Custom Anthropic proxy |
| `awg-config` | AmneziaVPN config |
| `openvpn` | OpenVPN config |

### Module: `system/users.nix`

Creates the user "aliz" with hashed password from secrets.

### Module: `system/boot.nix`

- **GRUB bootloader** with EFI support
- **NTFS filesystem** support
- **OS prober** for dual-boot detection
- **Memtest86+** availability

### Module: `system/nix.nix`

- **Flakes enabled**
- **nix-ld** for running non-Nix binaries
- **NUR repository** enabled
- **Automatic GC** - Weekly, deletes older than 30 days
- **Proxy configuration** for nix-daemon

### Module: `system/network.nix`

Comprehensive networking with:

**Proxy Management:**
- `chproxy` utility - Switch between configured proxies
- Systemd `proxy.service` - Manages active proxy from `/etc/current-proxy`
- Always available on `localhost:1080` (socks5)

**VPN Options:**
- ExpressVPN (custom FHS-based package)
- OpenVPN
- AmneziaVPN (awg - AmneziaWireGuard)
- Tor

**Custom Packages:**
- `slipstream` - QUIC-based covert DNS tunnel for censorship circumvention
- `paqet` - Packet-level proxy using raw sockets
- `snowflake` - WebRTC-based censorship circumvention

### Module: `system/printing.nix`

Enables CUPS printing with drivers for:
- Gutenprint (quality printer drivers)
- HPLIP (HP printers)
- Splix (Samsung printers)

---

## GUI Modules

### Module: `gui/default.nix`

Aggregates all GUI modules and configures:

- **Hyprland** - Wayland compositor with XWayland
- **SDDM** - Display manager with HiDPI support
- **XDG portals** - for Wayland sandboxing
- **Fonts** - JetBrains Mono, Fira Code, Vazir Code (Persian)
- **Input method** - fcitx5 with Mozc (Japanese)
- **Screenshots** - Flameshot
- **Notifications** - Dunst
- **GTK theme** - Materia-dark

### Module: `gui/hyprland-config.nix`

**Monitor Setup:**
- HDMI-A-1 (primary, 1920x1080@144Hz)
- eDP-1 (internal laptop display)

**Keybindings:**
- `SUPER` = Mod key
- `SUPER + RETURN` = Terminal
- `SUPER + Q` = Close window
- `SUPER + H/J/K/L` = Vim-style window focus
- `SUPER + SHIFT + H/J/K/L` = Vim-style window swap
- `SUPER + 1-9` = Switch to workspace
- `SUPER + SHIFT + 1-9` = Move to workspace

**Window Rules:**
- JetBrains apps → workspace 2
- Thorium browser → workspace 3
- Discord → workspace 4
- Neovide/Alacritty → workspace 1

**Touch Gestures (Hyprgrass):**
- Swipe up from bottom (4 fingers) → Workspace overview (Hyprexpo)
- Swipe left/right (3 fingers) → Switch workspace
- Swipe left/right (4 fingers) → Move window

### Module: `gui/waybar.nix`

Status bar with modules:

| Module | Description |
|--------|-------------|
| Workspaces | Hyprland workspaces with emoji icons |
| MPRIS | Media player info (title, artist) |
| Network | WiFi/Ethernet status with bandwidth |
| CPU | CPU usage percentage |
| Memory | RAM usage |
| Battery | Battery status (laptop only) |
| Backlight | Brightness control |
| Temperature | CPU temperature |
| PulseAudio | Volume control |
| Keyboard | Layout indicator (Persian/English) |
| Clock | Date and time |
| Tray | System tray |

### Module: `gui/firefox.nix`

Configuration:
- **Privacy** - Disable studies, telemetry, Pocket
- **Extensions** - Bitwarden, Tridactyl, FoxyProxy
- **Search** - DuckDuckGo default
- **UI** - Hide tabs bar (Tridactyl manages tabs)

### Module: `gui/media.nix`

- **Pipewire** - Audio server with ALSA and PulseAudio compatibility
- **Bluetooth** - Blueman for device management
- **Applications** - VLC, mpv, mkvtoolnix, popcorn time

---

## CLI Modules

### Module: `cli/default.nix`

**Shell:**
- Zsh with oh-my-zsh
- Plugins: git, python, man, vi-mode, docker
- `z` for directory navigation (zoxide)

**Environment Variables:**
- AI API keys (OpenAI, Groq, OpenRouter, Anthropic)
- Editor = nv

**Taskwarrior:**
- Taskwarrior with Timewarrior integration
- Sync configuration with taskchampion server

### Module: `cli/alert.nix`

Telegram notification script (`al`):
- Sends text messages via bot
- Handles large messages (>4000 chars) as files
- Supports file attachments
- Uses proxy for connectivity

### Module: `cli/uri-short.nix`

URL shortcut creator - Creates commands like:
- `mathcha` → Mathcha.io
- `poe` → Poe.com
- `meet` → Google Meet

### Module: `cli/pgbkp/`

PostgreSQL backup wrapper tool.

---

## Programming Environment

### Module: `programming/default.nix`

**Version Control:**
- Git with user configuration
- Default branch: main

**Claude Code Integration:**
- API endpoint: `https://api.z.ai/api/anthropic`
- Model: `glm-4.7`
- MCP servers: web-search-prime, zai-mcp-server, web-reader, zread
- Hooks: notify-send + Telegram notifications

**Runtimes:**
- Node.js 24, pnpm, bun
- Python 3.10
- Rust (via fenix - custom Rust toolchain)

**Databases:**
- PostgreSQL 16 & 17
- lazydocker - Docker TUI
- lazysql - Database TUI
- sqlit-tui - SQLite TUI

**AI Tools:**
- aider-chat - AI pair programmer
- claude-code - CLI AI assistant

**Build Tools:**
- gcc, make
- uv - Python package manager
- cargo-watch - Rust development
- pre-commit - Git hooks

**Documentation:**
- mdbook with d2, pdf, pandoc plugins

### Module: `programming/editors.nix`

- **Neovide** - Neovim GUI
- **glrnvim** - Lazy-loading Neovim GUI
- **nixvim** - Modular Neovim configuration

### Module: `programming/virtualisation.nix`

- **Docker** with registry mirror
- **libvirt/KVM** for virtualization
- **virt-manager** GUI
- Custom data-root for Docker storage

### Package: `programming/aider-ce/`

Custom Aider AI assistant package with patches for Python 3.12 compatibility.

---

## Nixvim Configuration

### Architecture

Each aspect of Neovim is configured in a separate module under `programming/nixvim/`:

```
nixvim/
├── default.nix      # Plugin aggregator
├── options.nix      # Basic settings
├── lsp.nix          # LSP, completion
├── telescope.nix    # Fuzzy finder
├── ai.nix           # AI plugins (agentic)
├── terminal.nix     # Toggleterm
├── ui.nix           # lualine, neo-tree, which-key
├── navigation.nix   # Smart splits, cybu
├── gitsigns.nix     # Git integration
├── comment.nix      # Comment plugin
└── treesitter.nix   # Syntax highlighting
```

### Module: `nixvim/options.nix`

- **Colorscheme** - Tokyo Night
- **Leader key** - Space
- **Clipboard** - System clipboard integration
- **Indentation** - 2 spaces
- **Number lines** - Relative
- **Search** - Case-insensitive, smart case

### Module: `nixvim/lsp.nix`

**Completion (nvim-cmp):**
- LSP source
- Luasnip (snippets)
- Buffer (words in open buffers)
- Path (file paths)

**LSP Servers:**
- TypeScript: vtsls (primary), denols (deno projects)
- Python: pyright
- Rust: rust_analyzer
- Bash: bashls
- CSS: cssls, tailwindcss
- HTML: html
- Svelte: svelte
- GraphQL: graphql
- Docker: dockerls
- Nix: nixd

**Formatters (none-ls):**
- prettier, biome, black, nixfmt

**Keybindings:**
- `gd` - Go to definition
- `gr` - References
- `K` - Hover
- `F3/F4` - Diagnostic navigation
- `leader + c + a` - Code actions
- `leader + c + r` - Rename
- `leader + c + f` - Format

### Module: `nixvim/telescope.nix`

Keybindings:
- `leader + ff` - Find files
- `leader + fg` - Live grep
- `leader + fr` - Reopen last picker
- `leader + fb` - Buffers
- `leader + fp` - Project search

### Module: `nixvim/ai.nix`

**Agentic.nvim:**
- Custom-built from source
- Claude ACP integration
- Image support via img-clip
- Chat, inline edit, quick command modes

### Module: `nixvim/terminal.nix`

Toggleterm configuration:
- `leader + tt` - Toggle floating terminal
- `leader + th` - Toggle horizontal terminal
- `leader + tv` - Toggle vertical terminal

### Module: `nixvim/ui.nix`

- **lualine** - Status line
- **neo-tree** - File explorer
- **which-key** - Keybinding popup
- **web-devicons** - File icons
- **noice** - Better cmdline/ui
- **dressing** - Better UI for select/input

### Module: `nixvim/navigation.nix`

- **smart-splits** - Smart window navigation with tmux
- **cybu** - Buffer navigation with cycle
- **Resize** - `CTRL + h/j/k/l` to resize windows

### Module: `nixvim/gitsigns.nix**

Git integration:
- `]h/[h` - Next/previous hunk
- `leader + hs` - Stage hunk
- `leader + hr` - Reset hunk
- `leader + hp` - Preview hunk
- `leader + hb` - Blame line

### Module: `nixvim/treesitter.nix`

Incremental selection with:
- `init` - Init selection
- `init + v` - Node incremental
- `init + V` - Scope incremental

---

## Flake Architecture

## Flake Architecture

### Inputs

```nix
inputs = {
  disko.url = "github:nix-community/disko";
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  nixvim.url = "github:nix-community/nixvim";
  fenix.url = "github:nix-community/fenix";
  nur.url = "github:nix-community/NUR";
  nix-alien.url = "github:thiagokokada/nix-alien";
  home-manager.url = "github:nix-community/home-manager/release-25.11";
  llm-agents.url = "github:numtide/llm-agents.nix";
};
```

### Special Arguments

These are passed to all modules:

| Argument | Description |
|----------|-------------|
| `unstable` | Unstable nixpkgs with unfree enabled |
| `hardware-configuration` | Hardware-specific configuration |
| `llm-agents` | LLM agents packages |

### Secrets Injection

Secrets are loaded from gitignored `./vars/secrets.ehsan.nix` and injected via a dynamically created module:

```nix
secretsModule = { config, ... }: {
  config.userConfiguration.secrets = secrets;
};
```

Access in modules:
```nix
secrets = config.userConfiguration.secrets;
${secrets.OPENAI_API_KEY}
```

### System Definitions

The `system-definer` function creates configurations for all hosts:

```nix
system-definer secrets hardware-configuration = {
  nixos-new-laptop = { inherit specialArgs system; modules = [...]; };
  nixos-laptop = { inherit specialArgs system; modules = [...]; };
  nixos-home-desktop = { inherit specialArgs system; modules = [...]; };
  tablet = { inherit specialArgs system; modules = [...]; };
  usb = { inherit specialArgs system; modules = [...]; };
  iso = { inherit specialArgs system; modules = [...]; };
};
```

### Outputs

- `packages.x86_64-linux.nvim` - Nixvim-built Neovim
- `packages.x86_64-linux.iso` - ISO image
- `packages.x86_64-linux.usb` - USB image
- `nixosConfigurations.*` - All system configurations

---

## Secrets Management

### Schema

All secrets are defined in `vars/secrets.ehsan.nix` (gitignored) and accessed via `config.userConfiguration.secrets`.

### Required Keys

```nix
{
  HASHED_PASSWORD = "...";
  proxies = {
    xray = writeShellApplication { ... };
    "sing-box" = writeShellApplication { ... };
    v2ray = writeShellApplication { ... };
  };
  defaultProxy = "xray";
  OPENAI_API_KEY = "...";
  GROQ_API_KEY = "...";
  OPENROUTER_API_KEY = "...";
  ANTHROPIC_AUTH_TOKEN = "...";
  ANTHROPIC_BASE_URL = "...";
  location = {
    latitude = 35.6892;
    longitude = 51.3890;
  };
  taskwarrior-secret = {
    credentials = "...";
    server = "...";
    client_id = "...";
    encryption_key = "...";
  };
  NOTIFIER_BOT_TOKEN = "...";
  CHAT_ID = "...";
  awg-config = "...";
  openvpn = "...";
}
```

---

## Build Commands

### System Rebuild (Primary)

```bash
sudo https_proxy=http://localhost:1080 NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --flake path:./#nixos-new-laptop --impure
```

### Other Systems

```bash
# Desktop
sudo nixos-rebuild switch --flake .#nixos-home-desktop --impure

# Older laptop
sudo nixos-rebuild switch --flake .#nixos-laptop --impure

# Tablet
sudo nixos-rebuild switch --flake .#tablet --impure
```

### Build Images

```bash
# ISO image
sudo nixos-rebuild build --flake .#iso --impure

# USB installation
sudo nix run github:nix-community/disko -- --mode disko hosts/usb-disko.nix
echo -n "password" > /tmp/secret.key
sudo nixos-install --flake path:./#usb --impure --root /mnt
```

### Important Notes

- All builds use `--impure` flag because secrets are sourced from gitignored files
- `https_proxy` is set for Nix to fetch packages through proxy
- `NIXPKGS_ALLOW_UNFREE=1` enables proprietary packages (NVIDIA, etc.)

---

## Custom Applications

### Shell Applications

| Script | Purpose | Location |
|--------|---------|----------|
| `notitrans-fa` | Translate selection to Persian | `gui/notitrans-fa.nix` |
| `notitrans-en` | Translate selection to English | `gui/notitrans-en.nix` |
| `notitrans-dict` | Dictionary lookup | `gui/notitrans-dict.nix` |
| `search-select` | Search selection in Firefox | `gui/search-select.nix` |
| `ensure-class-hyprland` | Force window class for workspace | `gui/ensure-class-hyprland.nix` |
| `al` | Send Telegram notifications | `cli/alert.nix` |
| `chproxy` | Switch active proxy | `system/network.nix` |

### URL Shortcuts

Created via `cli/uri-short.nix`:

| Command | URL |
|---------|-----|
| `mathcha` | https://www.mathcha.io |
| `poe` | https://poe.com |
| `meet` | https://meet.google.com |

### Shell Aliases

| Alias | Command |
|-------|---------|
| `nv` | `neovide --fork` |

---

## Key Features

### 1. Modular Architecture

Each aspect of the system is a separate module that can be selectively imported. This allows for:
- Easy maintenance
- Code reuse across hosts
- Clear separation of concerns

### 2. Multi-Host Support

Single flake manages multiple machines with shared base configuration and host-specific overrides.

### 3. Proxy Management System

Centralized proxy switching with `chproxy` command:
- Multiple proxy types supported (xray, sing-box, v2ray)
- Systemd service manages active proxy
- Always available on localhost:1080

### 4. Covert Communication Tools

- **Slipstream** - QUIC-based DNS tunnel for bypassing deep packet inspection
- **Paqet** - Packet-level proxy using raw sockets
- **Snowflake** - WebRTC-based censorship circumvention

### 5. AI-Integrated Development

- **Claude Code** - CLI AI assistant with MCP servers
- **Agentic.nvim** - Neovim AI assistant with Claude ACP
- **Aider** - AI pair programmer
- Multiple LLM backends (OpenAI, Groq, OpenRouter, Anthropic)

### 6. Wayland-Native Desktop

- Hyprland compositor with full touch gesture support
- Hyprexpo for workspace overview
- Sway/MIG (Mod + I) for input method switching
- Per-window input method

### 8. Advanced Neovim Configuration

- Modular nixvim setup
- Comprehensive LSP support
- Smart window navigation
- AI-assisted coding

### 9. Taskwarrior Synchronization

- Taskchampion sync server on desktop
- Sync configuration on all hosts
- Prayer time integration

### 10. Bilingual Support

- Persian keyboard layout option
- Translation scripts for both directions
- Persian fonts (Vazir Code)
- RTL text handling

---

## Module Import Hierarchy

```
flake.nix
└── nixosConfigurations
    └── hosts/<host>.nix
        └── hosts/base.nix
            └── default.nix
                ├── system/default.nix
                │   ├── userInfo.nix
                │   ├── boot.nix
                │   ├── users.nix
                │   ├── nix.nix
                │   ├── network.nix
                │   └── printing.nix
                ├── gui/default.nix
                │   ├── hyprland-config.nix
                │   ├── waybar.nix
                │   ├── rofi.nix
                │   ├── firefox.nix
                │   └── media.nix
                ├── cli/default.nix
                │   ├── alert.nix
                │   ├── uri-short.nix
                │   └── pgbkp/default.nix
                ├── programming/default.nix
                │   ├── editors.nix
                │   ├── virtualisation.nix
                │   └── nixvim/*
```

---

## Common Patterns

### Accessing Secrets

```nix
{ config, ... }:
let
  secrets = config.userConfiguration.secrets;
in
{
  environment.variables.OPENAI_API_KEY = secrets.OPENAI_API_KEY;
}
```

### Home Manager Integration

```nix
home-manager.users.${userName} = {
  programs.git.enable = true;
  xdg.configFile."waybar/config".text = "..."
};
```

### Conditional Configuration

```nix
lib.mkIf enableFeature { ... }
lib.optionals enableFeature someModule
lib.mkForce false  # Override options
```

### Custom Shell Application

```nix
writeShellApplication {
  name = "my-script";
  runtimeInputs = [ pkgs.curl pkgs.jq ];
  text = ''
    #!/bin/sh
    echo "Hello, World!"
  '';
}
```

---

*Generated for NixOS configuration management*
