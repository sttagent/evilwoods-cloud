#!/usr/bin/env bash

set -euo pipefail

function evildnf {
  dnf -y \
    --setopt=keepcache=true "$@"
}

curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-$(rpm -E %fedora)/scottames-ghostty-fedora-$(rpm -E %fedora).repo" |
  sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo >/dev/null

evildnf install \
  "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
  "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
evildnf swap mesa-va-drivers mesa-va-drivers-freeworld
evildnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
evildnf install \
  fish \
  neovim \
  tailscale \
  ripgrep \
  fd-find \
  bat \
  just \
  fzf \
  gnome-shell-extension-appindicator \
  zoxide \
  ghostty

# kver=$(cd /usr/lib/modules && echo *)
# dkms autoinstall -k "$kver"
# akmods --force --kernels "$kver"
