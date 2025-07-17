# Dotfiles

[![GPL-3.0 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Wiki](https://img.shields.io/badge/📖-Wiki-8CA1AF)](https://gitlab.com/anmomu92/dotfiles/-/wikis/home)
[![State](https://img.shields.io/badge/estado-activo-brightgreen)]()
[![System](https://img.shields.io/badge/🖥️-Linux/macOS-999999)]()
[![Manteinance](https://img.shields.io/badge/👤-anmomu92-yellow)]()

This repository contains dotfiles specific to my Arch Linux distro. As I have different distros for different hardware and/or purpose, I have decided to make different repos for each of them, so my configuration directory is not cluttered. In this particular case, most of the dotfiles are based on the excelent work carried out by [ML4W's dotfiles](https://github.com/mylinuxforwork/dotfiles).

## ⚡ Main features

- **Terminal emulator**: Kitty. 
- **Shell**: Zsh + starship prompt (no plugins).
- **Text editor**: Neovim.
- **Window manager**: Hyprland.
- **Colorscheme**: Matugen + Wallust.

## 🛠️ Installation

So far, there is no installation script. Thus, in order to install a given dotfile, you have manually copy it to your app config location. I plan to do an installation script in the function.

> **NOTE**  
> Installation script is a TODO task.

### Bare repo
Add the following line in your shell's dotfile (`.bashrc`, `.zshrc`...):

```bash
alias dg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Run these instructions:

```bash
echo ".dotfiles >> .gitignore"
git clone --bare https://gitlab.com/anmomu92/dotfiles
dg checkout     # if error, remove indicated files after backup
dg config --local status.showUntrackedFiles no
```

This method will pull my dotfiles. In case you want to customize them to your likings, fork the repo and substitute the URL accordingly.


```

⚠️ Warning 

These dotfiles are customized for my preferences. Use at your own risk! It is recommended:

1. To do a backup of your current dotfiles.
2. To review the dotfiles before applying them.
3. To apply dotfiles gradually.

🤝 Contributios

Though these dotfiles are personal, any kind of suggestion or improvement is suggested. Please, open an issue or merge request to discuss changes.

📜 License

GPL-3.0 license.
