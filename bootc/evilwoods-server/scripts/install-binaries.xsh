$RISE_SUBPROC_ERROR = True

atuin_archive_name = "atuin-x86_64-unknown-linux-gnu"

chezmoi_version = "2.59.0"
chezmoi_dir = f"chezmoi_{chezmoi_version}_linux-glibc_amd64"
chezmoi_archive = f"{chezmoi_dir}.tar.gz"

bitwarden_version = "1.0.0"
bitwarden_archive = f"bws-x86_64-unknown-linux-gnu-{bitwarden_version}.zip"

zellij_archive = "zellij-x86_64-unknown-linux-musl.tar.gz"

lego_version = "4.21.0"
lego_archive = f"lego_v{lego_version}_linux_amd64.tar.gz"

mkdir -p usr/local/bin
wget -q @(f"https://github.com/bitwarden/sdk-sm/releases/download/bws-v{bitwarden_version}/{bitwarden_archive}")
unzip @(bitwarden_archive)
cp bws usr/local/bin/

# Install atuin
wget -q @(f"https://github.com/atuinsh/atuin/releases/latest/download/{atuin_archive_name}.tar.gz")
tar -xvf @(atuin_archive_name + ".tar.gz")
cp  @(atuin_archive_name)/atuin usr/local/bin/

# Install chezmoi
wget -q @(f"https://github.com/twpayne/chezmoi/releases/download/v{chezmoi_version}/{chezmoi_archive}")
tar -x chezmoi -f @(chezmoi_archive)
cp chezmoi usr/local/bin/

#install zellij
wget -q @(f"https://github.com/zellij-org/zellij/releases/latest/download/{zellij_archive}")
tar -xf @(zellij_archive)
cp zellij usr/local/bin/

# install lego (letsencrypt)
wget  @(f"https://github.com/go-acme/lego/releases/download/v{lego_version}/{lego_archive}")
tar -xvf @(lego_archive)
cp lego usr/local/bin/
