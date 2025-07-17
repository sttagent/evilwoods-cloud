#!/usr/bin/env bash

set -euo pipefail

mkdir -p /var/opt

dnf -y config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf -y install https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm
# dnf -y copr enable pgdev/ghostty && dnf -y install ghostty
dnf -y install fish neovim tailscale ripgrep fd-find bat just
dnf -y remove firefox firefox-langpacks
dnf -y clean all
