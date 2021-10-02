<h1 align="center">ROllerozxa's .zshrc</h1>

<p align="center"><img style="text-align:center" src="https://user-images.githubusercontent.com/60856959/135720852-df50e18a-aa6b-4467-9972-14a1e4d5236f.png"></p>

<p align="center">This is my personal Zsh config, loosely based off of Manjaro's Zsh config.</p>

## Plugins
- `zsh-autosuggestions`
- `zsh-completions`

- `zsh-history-substring-search`
- `zsh-syntax-highlighting`

## Installation
### Arch
For Arch-based distributions, there is a PKGBUILD that allows you to build an Arch package out of it. You can either build it yourself or use the prebuilt package in my [personal Arch repository](https://github.com/rollerozxa/arch-repo).

When the package is installed, run `install-zshrc-rollerozxa` to install it to the home folder of the current user. It will update as the package updates as it is being symlinked and not copied.

### Manual
Just copy the .zshrc into the root of your home folder. (`cp zshrc ~/.zshrc`)

Don't forget to install the required Zsh plugins listed in [Plugins](#plugins).
