#!/usr/bin/env bash

set -euo pipefail

dnf -y config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
# dnf -y copr enable pgdev/ghostty && dnf -y install ghostty
dnf -y install fish neovim tailscale ripgrep fd-find bat
dnf -y remove firefox firefox-langpacks
dnf -y clean all
