# NixOS Configuration - Installed Packages

This document lists all packages installed in this NixOS configuration organized by category.

## Table of Contents

- [CLI Tools](#cli-tools)
- [GUI/Desktop](#guidesktop)
- [Media Applications](#media-applications)
- [Programming/Development](#programmingdevelopment)
- [Text Editors](#text-editors)
- [System](#system)

---

## CLI Tools

### File Management & Navigation

| Package | Description |
|---------|-------------|
| **fd** | A simple, fast and user-friendly alternative to `find` |
| **ripgrep** | A fast, recursive search tool that combines the usability of `ag` with the raw speed of `grep` |
| **tree** | Recursive directory listing command that produces a depth indented listing of files |
| **ncdu** | NCurses Disk Usage Analyzer - interactive disk usage utility |
| **yazi** | A terminal file manager written in Rust |
| **zoxide** | A smarter `cd` command that learns your habits |
| **unzip** | Utility for extracting/compressing ZIP archives |
| **zip** | Utility for creating ZIP archives |
| **unrar-wrapper** | Wrapper for extracting RAR archives |

### Text Processing & Viewing

| Package | Description |
|---------|-------------|
| **vim** | Highly configurable text editor built for efficient text editing |
| **bat** | A `cat` clone with syntax highlighting and Git integration |
| **jq** | Lightweight and flexible command-line JSON processor |
| **sd** | Intuitive find & replace CLI (sed alternative) |
| **pup** | HTML parsing tool from command line |
| **lynx** | Text-based web browser |

### Terminal Multiplexers

| Package | Description |
|---------|-------------|
| **tmux** | Terminal multiplexer - lets you switch easily between several programs in one terminal |
| **zellij** | A terminal workspace with features similar to tmux but with a modern approach |

### System Monitoring & Management

| Package | Description |
|---------|-------------|
| **btop** | Resource monitor with a beautiful interface (top/htop alternative) |
| **nethogs** | Net top tool grouping bandwidth per process |
| **nix-tree** | Interactive TUI for visualizing Nix store dependencies |
| **killall** | Kill processes by name |
| **v4l-utils** | Video4Linux utilities for webcam/video devices |

### Network & Download

| Package | Description |
|---------|-------------|
| **wget** | Command-line download manager |
| **curl** | Command-line tool for transferring data with URLs |
| **aria2** | Multi-protocol download utility with segmented downloading |
| **caddy** | Extensible, cross-platform, web server with automatic HTTPS |
| **github-cli** | Official GitHub command-line tool (`gh`) |
| **ddgr** | DuckDuckGo from the terminal |
| **linux-wifi-hotspot** | Linux wifi hotspot script for sharing internet |

### AI & LLM Tools

| Package | Description |
|---------|-------------|
| **aichat** | Command-line AI chat interface supporting multiple LLM providers |
| **llm-agents.claude-code-acp** | Claude Code Agent Control Protocol |
| **llm-agents.claude-plugins** | Claude plugins for LLM agents |
| **llm-agents.skills-installer** | Skills installer for Claude Code |

### Task & Time Management

| Package | Description |
|---------|-------------|
| **taskwarrior3** | Feature-rich command-line task management |
| **timewarrior** | Time tracking utility that works with Taskwarrior |

### Development Utilities

| Package | Description |
|---------|-------------|
| **nix-alien** | Tool for running non-Nix executables in NixOS by patching dependencies |
| **pgbkp** | PostgreSQL backup tool (custom package) |
| **openssl** | Cryptography toolkit implementing SSL/TLS |
| **chntpw** | Utility to reset Windows NT passwords |
| **jcal** | Jalali (Persian) calendar utilities |
| **ariang** | Web frontend for Aria2 download manager |

### Shell

| Package | Description |
|---------|-------------|
| **zsh** | Z shell - extended Bourne shell with many improvements |
| **oh-my-zsh** | Framework for managing Zsh configuration |

### Custom Shell Applications

| Name | Description |
|------|-------------|
| **ai** | Alacritty launcher for Aider sessions |
| **alert** (`al`) | Telegram notification system |

---

## GUI/Desktop

### Window Manager & Compositor

| Package | Description |
|---------|-------------|
| **hyprland** | Dynamic tiling Wayland compositor |
| **hyprpaper** | Wallpaper utility for Hyprland |
| **hyprlandPlugins.hyprgrass** | Touch gestures plugin for Hyprland |
| **hyprlandPlugins.hyprbars** | Title bar plugin for Hyprland |
| **hyprlandPlugins.hyprexpo** | Workspace overview plugin for Hyprland |

### Wayland Utilities

| Package | Description |
|---------|-------------|
| **waybar** | Highly customizable Wayland status bar |
| **wofi** | Launcher/menu for Wayland |
| **rofi** | Window switcher, application launcher and dmenu replacement |
| **wvkbd** | Virtual keyboard for Wayland |
| **xdg-desktop-portal** | Desktop integration portals for sandboxed applications |
| **xdg-desktop-portal-wlr** | XDG desktop portal for wlroots-based compositors |
| **xdg-desktop-portal-gtk** | GTK implementation of XDG desktop portal |

### Terminal

| Package | Description |
|---------|-------------|
| **alacritty** | GPU-accelerated terminal emulator |

### Notifications & System Tools

| Package | Description |
|---------|-------------|
| **dunst** | Lightweight notification daemon |
| **libnotify** | Library for sending desktop notifications |
| **pavucontrol** | PulseAudio volume control GUI |
| **i3status** | Status line generator for i3bar/swaybar |
| **polkit-gnome-authentication-agent-1** | PolicyKit authentication agent for GNOME |

### Clipboard & Screen Tools

| Package | Description |
|---------|-------------|
| **wl-clipboard** | Command-line copy/paste utilities for Wayland |
| **grim** | Screenshot utility for Wayland |
| **swappy** | Snapshot editing tool for Wayland |
| **flameshot** | Powerful screenshot tool with editing capabilities |

### Input & Accessibility

| Package | Description |
|---------|-------------|
| **fcitx5** | Next generation Input Method Framework |
| **fcitx5-mozc** | Japanese input method (Mozc) for Fcitx5 |
| **fcitx5-gtk** | GTK integration for Fcitx5 |
| **libinput** | Input device handling library |
| **lisgd** | libinput手势守护进程 (gesture daemon) |

### Desktop Applications

| Package | Description |
|---------|-------------|
| **scrcpy** | Display and control Android devices via USB |
| **libreoffice** | Full-featured office suite |
| **xarchiver** | Lightweight GTK+ archive manager |
| **thunar** | Modern file manager for XFCE |

### Themes & Icons

| Package | Description |
|---------|-------------|
| **materia-theme** | Material Design theme for GTK |
| **arc-icon-theme** | Arc icon theme for GTK desktops |
| **vanilla-dmz** | Simple, neutral DMZ cursor theme |

### Fonts

| Package | Description |
|---------|-------------|
| **nerd-fonts.jetbrains-mono** | JetBrains Mono font with Nerd Font icons |
| **nerd-fonts.fira-code** | Fira Code font with Nerd Font icons (includes ligatures) |
| **vazir-code-font** | Persian/Arabic code font |

### Display Manager

| Package | Description |
|---------|-------------|
| **sddm** | Simple Desktop Display Manager (Wayland enabled) |

### Messaging

| Package | Description |
|---------|-------------|
| **telegram-desktop** (unstable) | Telegram desktop messaging client |

### Translation

| Package | Description |
|---------|-------------|
| **translate-shell** | Command-line translator using Google Translate |

---

## Media Applications

| Package | Description |
|---------|-------------|
| **vlc** | Cross-platform multimedia player and framework |
| **mpv** | Media player based on MPlayer and mplayer2 |
| **ffmpeg** | Complete solution to record, convert and stream audio and video |
| **mkvtoolnix** | Matroska media file creation and manipulation tools |
| **popcorntime** | Streaming torrent movie player |

### Audio & Bluetooth

| Package | Description |
|---------|-------------|
| **pipewire** | Low-latency audio/video server (with ALSA and PulseAudio support) |
| **blueman** | GTK+ Bluetooth Manager |
| **pulseaudio** (via pipewire) | Sound system for POSIX OS |

---

## Programming/Development

### Languages & Runtimes

| Package | Description |
|---------|-------------|
| **nodejs_24** (unstable) | JavaScript runtime built on Chrome's V8 engine |
| **bun** (unstable) | Fast JavaScript runtime, bundler, test runner, and package manager |
| **deno** (unstable) | Secure JavaScript and TypeScript runtime |
| **python310** | Python 3.10 programming language |
| **vlang** (unstable) | Simple, fast, safe, compiled programming language |
| **pnpm** (unstable) | Fast, disk space efficient package manager for Node.js |

### Build Tools & Compilers

| Package | Description |
|---------|-------------|
| **gcc** | GNU Compiler Collection (C, C++, etc.) |
| **cargo** | Rust package manager and build tool |
| **rustc** | Rust compiler |
| **clippy** | Rust linter |
| **rustfmt** | Rust code formatter |
| **rust-src** | Rust source code for IDE integration |
| **typescript** | TypeScript language and compiler |

### Version Control

| Package | Description |
|---------|-------------|
| **git** | Distributed version control system |
| **lazygit** | Terminal UI for git commands |

### Databases

| Package | Description |
|---------|-------------|
| **postgresql_16** | Powerful open source database (client tools) |
| **postgresql_17** (service) | PostgreSQL 17 server |
| **lazysql** (unstable) | Terminal UI for MySQL and PostgreSQL |
| **sqlit-tui** (unstable) | Terminal UI for SQLite databases |
| **pgadmin** | Web-based PostgreSQL administration tool |
| **lazydocker** | Terminal UI for Docker |

### AI-Assisted Development

| Package | Description |
|---------|-------------|
| **claude-code** (unstable) | Anthropic's Claude AI coding assistant CLI |
| **aider-chat** (unstable) | AI pair programming tool that works in your terminal |
| **playwright-mcp** (unstable) | Playwright Model Context Protocol server for browser automation |
| **playwright-driver.browsers** | Browser binaries for Playwright |

### Documentation

| Package | Description |
|---------|-------------|
| **mdbook** | Create books from Markdown files |
| **mdbook-d2** | D2 diagram plugin for mdBook |
| **mdbook-pdf** | PDF renderer for mdBook |
| **mdbook-pandoc** | Pandoc renderer for mdBook |
| **d2** | Diagram scripting language that turns text to diagrams |

### Python Tools

| Package | Description |
|---------|-------------|
| **uv** | Fast Python package installer and resolver, written in Rust |

### Development Utilities

| Package | Description |
|---------|-------------|
| **cloc** | Count Lines of Code - counts blank lines, comment lines, and physical lines |
| **pre-commit** | Framework for managing and maintaining multi-language pre-commit hooks |
| **nixfmt-tree** | Nix file formatter that formats entire directory trees |
| **cargo-watch** | Utility for cargo to compile/watch/run commands on file changes |

### Virtualization & Containerization

| Package | Description |
|---------|-------------|
| **docker** | Open platform for developing, shipping, and running applications in containers |
| **libvirtd** | Server for libvirt virtualization API |
| **virt-manager** | Desktop UI for managing virtual machines |

---

## Text Editors

| Package | Description |
|---------|-------------|
| **neovim** (nixvim) | Neovim with modular configuration via nixvim |
| **neovide** | GUI frontend for Neovim written in Rust |
| **glrnvim** | Neovim GUI wrapper with floating terminals |
| **vscode** | Visual Studio Code - code editor by Microsoft |

### Neovim Configuration (nixvim)

The Neovim installation includes a modular configuration with:
- LSP support (Language Server Protocol)
- Telescope (fuzzy finder)
- Avante AI assistant
- Treesitter syntax highlighting
- Terminal integration
- Git integration
- And more...

---

## System

### Core Services

| Package | Description |
|---------|-------------|
| **ollama** (unstable) | Run LLaMA, Mistral, and other large language models locally |

### Security & Authentication

| Package | Description |
|---------|-------------|
| **openssh** | OpenBSD SSH server and client |
| **gnupg** | GNU Privacy Guard - encryption/signing tool |
| **polkit** | Application-level toolkit for handling privileged operations |

### Printing

| Package | Description |
|---------|-------------|
| **cups** (service) | Common UNIX Printing System |

### Location Services

| Package | Description |
|---------|-------------|
| **redshift** (via location config) | Color temperature adjustment based on time of day |

---

## Custom Packages

### Shell Applications (via `writeShellApplication`)

| File | Description |
|------|-------------|
| `gui/notitrans-fa.nix` | Translate selected text to Persian |
| `gui/notitrans-en.nix` | Translate selected text to English |
| `gui/notitrans-dict.nix` | Dictionary lookup for selected text |
| `gui/search-select.nix` | Search selected text in Firefox |
| `gui/aiask.nix` | AI assistant shortcut |
| `gui/ensure-class.nix` | Force window to run with specific class |
| `cli/alert.nix` | Telegram notifier (`al` command) |

### Custom Derivations

| Package | Description |
|---------|-------------|
| **pgbkp** | Custom PostgreSQL backup utility |
| **aider-ce** | Community edition of Aider AI coding assistant |
| **slipstream** | Custom DNS channel package |
| **prayers-times-kit** | Rust-based prayer times calculator |

---

## Package Sources

- **Stable**: Packages from the stable NixOS channel
- **Unstable**: Packages from the unstable NixOS channel (`unstable.` prefix)
- **Fenix**: Rust toolchain via fenix overlay
- **Custom**: Locally defined packages

---

## Summary Statistics

- **CLI Tools**: ~45 packages
- **GUI/Desktop**: ~35 packages
- **Media**: ~7 packages
- **Programming/Development**: ~40 packages
- **Text Editors**: 4 main editors
- **System**: ~5 packages
- **Custom Utilities**: ~8 packages

**Total**: ~140+ packages

---

*Generated from NixOS configuration flake located at `/home/aliz/nixos-configuration`*
