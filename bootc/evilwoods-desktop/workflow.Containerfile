ARG FEDORA_VERSION=42
FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_VERSION}

RUN --mount=type=bind,src=./context,dst=/context,relabel=shared \
  --mount=type=bind,src=/var/cache/libdnf5/,dst=/var/cache/libdnf5,relabel=shared \
  bash /context/scripts/install-packages.bash
