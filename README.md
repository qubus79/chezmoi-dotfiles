# chezmoi-dotfiles

This repo contains the configuration to setup my machines. This is using [Chezmoi](https://chezmoi.io), the dotfile manager to setup the install.

This is work in progrees to become automated setup for MacOS and Linux (Ubuntu) machines.

## How to run

```shell
export GITHUB_USERNAME=qubus79
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
