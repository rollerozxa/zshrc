<h1 align="center">ROllerozxa's .zshrc</h1>

<p align="center"><img style="text-align:center" src="https://user-images.githubusercontent.com/60856959/135720852-df50e18a-aa6b-4467-9972-14a1e4d5236f.png"></p>

<p align="center">This is my personal Zsh config, loosely based off of Manjaro's Zsh config.</p>

## Plugins
- `zsh-autosuggestions`
- `zsh-history-substring-search`
- `zsh-syntax-highlighting`

These plugins are available as submodules in `plugins/` for convenience.

## Installation
First of all, recursively clone it to fetch vendored plugins:

```bash
git clone --recursive https://github.com/rollerozxa/zshrc
```

### Arch
For Arch-based distributions, there is a PKGBUILD that allows you to build an Arch package out of it. Simply `cd packaging && makepkg -fi` to build and install the package.

When the package is installed, run `install-zshrc-rollerozxa` to install it to the home folder of the current user. It will update as the package updates as it is being symlinked and not copied.

### Manual
Just copy the .zshrc into the root of your home folder. (`cp zshrc ~/.zshrc`)

Don't forget to install the required Zsh plugins listed in [Plugins](#plugins). If your distro doesn't have the plugins available then you can manually copy the vendored plugins in `plugins/` though this is dirty.
