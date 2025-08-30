# Dotfiles

Personal configuration files for my development environment.  
This repository helps me keep my setup consistent across machines and makes it easy to bootstrap a new system.

## Contents

- **.zshrc** → Zsh shell configuration
- **.gitconfig** → Git aliases, username, and preferences
- **.config/** → App configurations (e.g., `nvim`, `ghostty`, `tmux`)

## Requirements

Make sure you have the following packages installed on your system

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

Clone the repo into your home directory

```
$ git clone https://github.com/pravinkori/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

Using GNU stow create symlinks easily

```
$ stow .
```