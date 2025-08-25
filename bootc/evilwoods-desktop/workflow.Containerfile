ARG FEDORA_VERSION=42
FROM ghcr.io/sttagent/evilwoods-binary-cache:latest AS binary-cache


FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_VERSION}

RUN dnf -y remove firefox firefox-langpacks

RUN \
  --mount=type=bind,src=./context,dst=/context,relabel=shared \
  --mount=type=bind,from=binary-cache,src=/rpms,dst=/rpms,relabel=shared \
  --mount=type=bind,src=/var/cache/libdnf5/,dst=/var/cache/libdnf5,relabel=shared \
dnf -y --setopt=keepcache=true config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo && \
curl -fsSL "https://copr.fedorainfracloud.org/coprs/scottames/ghostty/repo/fedora-$(rpm -E %fedora)/scottames-ghostty-fedora-$(rpm -E %fedora).repo" | \
  sudo tee /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:scottames:ghostty.repo >/dev/null && \

dnf -y --setopt=keepcache=true  install \
  "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
  "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" && \
dnf -y --setopt=keepcache=true swap mesa-va-drivers mesa-va-drivers-freeworld && \
dnf -y --setopt=keepcache=true swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld && \
dnf -y --setopt=keepcache=true install \
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

COPY context/config/usr /usr
