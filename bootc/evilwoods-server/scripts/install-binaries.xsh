$RISE_SUBPROC_ERROR = True

atuin_archive_name = "atuin-x86_64-unknown-linux-gnu"

chezmoi_version = "2.59.0"
chezmoi_dir = f"chezmoi_{chezmoi_version}_linux-glibc_amd64"
chezmoi_archive = f"{chezmoi_dir}.tar.gz"

bitwarden_version = "1.0.0"
bitwarden_archive = f"bws-x86_64-unknown-linux-gnu-{bitwarden_version}.zip"

zellij_archive = zellij-x86_64-unknown-linux-musl.tar.gz

mkdir -p usr/local/bin

wget @(f"https://github.com/bitwarden/sdk-sm/releases/download/bws-v{bitwarden_version}/bws-aarch64-unknown-linux-gnu-{bitwarden_version}.zip")
unzip @(bitwarden_archive)
cp bws usr/local/bin/

# Install atuin
wget  @(f"https://github.com/atuinsh/atuin/releases/latest/download/{atuin_archive_name}.tar.gz")
tar -xvf @(atuin_archive_name + ".tar.gz")
cp  @(atuin_archive_name)/atuin usr/local/bin/

# Install chezmoi
wget  @(f"https://github.com/twpayne/chezmoi/releases/download/v{chezmoi_version}/{chezmoi_archive}")
tar -x chezmoi -f @(chezmoi_archive)
cp chezmoi usr/local/bin/

#install zellij
wget -q @(f"https://github.com/zellij-org/zellij/releases/download/latest/{zellij_archive}")
tar -x zellij -f @(zellij_archive) -C usr/local/bin/

