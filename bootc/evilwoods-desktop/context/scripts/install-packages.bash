#!/usr/bin/env bash

set -euo pipefail

mkdir -p /var/opt

cp --no-target-directory -vR /context/config/usr /usr

cp -r /usr/etc/yum.repos.d /etc/

dnf --setopt=keepcache=true -y install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
  "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
dnf --setopt=keepcache=true -y swap mesa-va-drivers mesa-va-drivers-freeworld
dnf --setopt=keepcache=true -y swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
# dnf -y copr enable pgdev/ghostty && dnf -y install ghostty
dnf --setopt=keepcache=true -y install fish neovim tailscale ripgrep fd-find bat just fzf gnome-shell-extension-appindicator zoxide # tuxedo-control-center
dnf --setopt=keepcache=true -y remove firefox firefox-langpacks

# kver=$(cd /usr/lib/modules && echo *)
# dkms autoinstall -k "$kver"
# akmods --force --kernels "$kver"
