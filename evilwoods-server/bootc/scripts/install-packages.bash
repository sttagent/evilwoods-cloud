#!/usr/bin/env bash

set -euo pipefail

dnf -y install epel-release
dnf -y install rsync fish qemu-guest-agent firewalld cockpit cockpit-podman cockpit-ostree unzip wget
dnf config-manager -y --add-repo https://pkgs.tailscale.com/stable/centos/10/tailscale.repo
dnf -y install tailscale
dnf -y install https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm
dnf clean all
