$RISE_SUBPROC_ERROR = True

atuin_archive_name = "atuin-x86_64-unknown-linux-gnu"

chezmoi_version = "2.59.0"
chezmoi_dir = f"chezmoi_{chezmoi_version}_linux-glibc_amd64"
chezmoi_archive = f"{chezmoi_dir}.tar.gz"

mkdir -p usr/local/bin

# Install atuin
wget  @(f"https://github.com/atuinsh/atuin/releases/latest/download/{atuin_archive_name}.tar.gz")
tar -xvf @(atuin_archive_name + ".tar.gz")
cp  @(atuin_archive_name)/atuin usr/local/bin/

