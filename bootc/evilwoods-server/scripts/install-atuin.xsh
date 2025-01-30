$RISE_SUBPROC_ERROR = True

atuin_files = "atuin-x86_64-unknown-linux-gnu"

wget -q @(f"https://github.com/atuinsh/atuin/releases/latest/download/{atuin_files}.tar.gz")

tar -xvf @(atuin_files + ".tar.gz")

cp  @(atuin_files + "/atuin") /app/
