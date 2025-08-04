#!/usr/bin/env bash

set -eo pipefail

atuin_archive_name="atuin-x86_64-unknown-linux-gnu"

chezmoi_version="2.63.1"
chezmoi_dir="chezmoi_${chezmoi_version}_linux-glibc_amd64"
chezmoi_archive="${chezmoi_dir}.tar.gz"

bitwarden_version="1.0.0"
bitwarden_archive="bws-x86_64-unknown-linux-gnu-${bitwarden_version}.zip"

zellij_archive="zellij-x86_64-unknown-linux-musl.tar.gz"

cd /tmp

wget -q "https://github.com/bitwarden/sdk-sm/releases/download/bws-v${bitwarden_version}/${bitwarden_archive}"
unzip $bitwarden_archive
cp bws /usr/local/bin/

# Install atuin
wget -q "https://github.com/atuinsh/atuin/releases/latest/download/${atuin_archive_name}.tar.gz"
tar -xvf "${atuin_archive_name}.tar.gz"
cp ${atuin_archive_name}/atuin /usr/local/bin/

# Install chezmoi
wget -q "https://github.com/twpayne/chezmoi/releases/download/v${chezmoi_version}/${chezmoi_archive}"
tar -x chezmoi -f $chezmoi_archive
cp chezmoi /usr/local/bin/

# Install zellij
wget -q "https://github.com/zellij-org/zellij/releases/latest/download/${zellij_archive}"
tar -xf $zellij_archive
cp zellij /usr/local/bin/

rm -r /tmp/*
