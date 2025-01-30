$RISE_SUBPROC_ERROR = True

atuin_archive_name = "atuin-x86_64-unknown-linux-gnu"
tailscale_version = "1.78.1"
tailscale_archive_name = f"tailscale_{tailscale_version}_amd64"

for path in ["bin", "sbin", "lib/systemd/system", "etc/default"]:
    mkdir -p usr/@(path)


wget -q @(f"https://github.com/atuinsh/atuin/releases/latest/download/{atuin_archive_name}.tar.gz")
tar -xvf @(atuin_archive_name + ".tar.gz")
cp  @(atuin_archive_name)/atuin usr/bin/

wget -q @(f"https://pkgs.tailscale.com/stable/{tailscale_archive_name}.tgz")
tar -xvf @(tailscale_archive_name + ".tgz")
cp @(tailscale_archive_name)/tailscale* usr/sbin/
cp @(tailscale_archive_name)/systemd/tailscaled.service usr/lib/systemd/system/
cp @(tailscale_archive_name)/systemd/tailscaled.defaults usr/etc/default/tailscaled
