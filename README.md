# Dotfiles

Personal configuration files for my development environment.  
This repository helps me keep my setup consistent across machines and makes it easy to bootstrap a new system.

## Contents

- **.zshrc** → Zsh shell configuration
- **.gitconfig** → Git aliases, username, and preferences
- **.config/** → App configurations (e.g., `nvim`, `ghostty`, `tmux`)

## Requirements

Before using these dotfiles, make sure the following tools are installed on your system:

- **zsh** → Shell (used as default shell)
- **git** → Version control
- **stow** → Symlink manager for dotfiles
- **neovim** (>= 0.9) → Text editor, configured with LazyVim
- **tmux** → Terminal multiplexer
- **fzf** (optional) → Fuzzy finder for enhanced navigation
- **ripgrep** (optional) → Fast file search for Neovim/Telescope
- **ghostty** or another terminal (optional) → Terminal emulator config

## Installation

Clone the repo into your home directory

```
$ git clone https://github.com/pravinkori/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
```

Using GNU stow create symlinks easily

```
$ stow .
```

## Clean bootstrapping
This repo includes a .gitignore file to keep runtime files, caches, plugins, and secrets out of Git.

When bootstrapping a new system, plugins will be installed automatically (e.g., with prefix `(ctrl+space) + I` in tmux for TPM, or `:PlugInstall` in Neovim).

### Examples

- **Histories**: .zsh_history, .bash_history

- **Plugins**: ~/.config/tmux/plugins/, ~/.config/nvim/plugged/

- **Cache & swap files**: .cache/, *.swp, *.tmp

- **Local overrides**: .zshrc.local, .tmux.conf.local

- **Secrets**: .env, .secrets/
