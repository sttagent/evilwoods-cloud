#!/usr/bin/env bash

set -euo pipefail

mkdir -p /var/opt

dnf -y config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf -y install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
  "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
dnf -y swap mesa-va-drivers mesa-va-drivers-freeworld
dnf -y swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
dnf -y install https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm
# dnf -y copr enable pgdev/ghostty && dnf -y install ghostty
dnf -y install fish neovim tailscale ripgrep fd-find bat just fzf gnome-shell-extension-appindicator zoxide
dnf -y remove firefox firefox-langpacks
dnf -y clean all
