#!/usr/bin/env bash

set -euo pipefail

dnf install -y dnf5-plugins
dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf -y install rsync qemu-guest-agent firewalld restic \
    cockpit cockpit-podman cockpit-ostree unzip wget fish tailscale
dnf clean all
