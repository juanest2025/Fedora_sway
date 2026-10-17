# Fedora Sway

A personalized Fedora Linux desktop powered by **Sway WM**, focused on minimalism, keyboard-driven workflows, performance, and a fully customized dark aesthetic.

This repository contains my personal dotfiles, scripts, keybindings, and desktop configurations for building a lightweight and productive Wayland environment on Fedora Linux.

## Screenshots

<!-- Add your desktop screenshots here -->

![Fedora Sway Desktop](screenshots/desktop.png)

## Features

- **Sway WM** — Dynamic tiling window management with custom keyboard shortcuts and workspace navigation.
- **Waybar** — Customized status bar with workspace indicators, system information, audio controls, network status, battery, and notifications.
- **Fuzzel** — Minimal application launcher and command menus.
- **Kitty** — GPU-accelerated terminal with a customized appearance and workflow.
- **Neovim** — Keyboard-driven text editing and development environment.
- **FZF** — Fuzzy file search with preview integration.
- **SwayNC** — Notification management.
- **Custom scripts** — Helpers for Wi-Fi, wallpapers, audio, brightness, system controls, and everyday tasks.
- **Dark visual design** — Custom colors, wallpapers, transparency, and a consistent desktop aesthetic.
- **Keyboard-first workflow** — Shortcuts designed to minimize mouse usage and keep common actions within easy reach.
- **Trackpad configuration** — Customized touchpad behavior for laptop use.

## Repository Structure

```text
Fedora_sway/
├── sway/          # Sway window manager configuration
├── waybar/        # Status bar configuration and styles
├── fuzzel/        # Application launcher configuration
├── kitty/         # Terminal configuration
├── nvim/          # Neovim configuration
├── scripts/       # Custom automation scripts
├── wallpapers/    # Desktop backgrounds
└── README.md
```

*The directory structure above is illustrative. Check the repository for the exact paths and names.*

## Philosophy

The goal is to build a desktop environment that is:

- **Minimal:** Only add tools that provide real value.
- **Efficient:** Prefer keyboard shortcuts and simple automation.
- **Lightweight:** Keep background services and unnecessary dependencies to a minimum.
- **Consistent:** Maintain a coherent visual style across applications.
- **Maintainable:** Keep configurations organized, understandable, and easy to restore.

## Installation

These dotfiles are tailored to my personal Fedora setup. Before applying them, review the configuration files and install the required dependencies.

Clone the repository:

```bash
git clone https://github.com/juanest2025/Fedora_sway.git
cd Fedora_sway
```

Back up your existing configuration before replacing any files:

```bash
mkdir -p ~/.config-backup
cp -a ~/.config/sway ~/.config-backup/ 2>/dev/null || true
```

Copy or selectively merge the configuration directories into `~/.config/` according to the structure of this repository.

**Important:** Do not overwrite your entire configuration blindly. Some scripts, application paths, keyboard layouts, and hardware settings may need to be adapted to your system.

## Requirements

- Fedora Linux
- Sway
- Waybar
- Fuzzel
- Kitty
- Neovim
- FZF
- SwayNC

Additional utilities may be required by individual scripts. Check their contents before running them.

## Customization

Feel free to explore the configuration files and adapt them to your own workflow, hardware, keyboard layout, and visual preferences.

These dotfiles are developed around my personal setup, so some keybindings and paths may differ from yours.

## Disclaimer

This is my personal desktop configuration, provided as-is. Changes may require adjustments depending on your Fedora version, installed packages, hardware, and existing configuration.

Always back up your files before applying changes.

## License

Unless otherwise specified, the configurations and scripts in this repository are shared for learning and personal customization. Check individual files for applicable licenses.
