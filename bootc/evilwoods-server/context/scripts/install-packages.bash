#!/usr/bin/env bash

set -euo pipefail

function evildnf {
  dnf -y \
    --setopt=keepcache=true "$@"
}

evildnf install -y dnf5-plugins
evildnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
evildnf install rsync qemu-guest-agent firewalld restic \
  cockpit cockpit-podman cockpit-ostree unzip wget fish tailscale fail2ban
