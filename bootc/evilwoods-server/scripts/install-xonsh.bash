#!/usr/bin/env bash

set -euo pipefail

EVILWOODS_XONSH_INSTALL_PATH=/usr/local/share/xonsh-env
EVILWOODS_PYTHON_VERSION=3.13

TARGET_DIR=$EVILWOODS_XONSH_INSTALL_PATH PYTHON_VER=$EVILWOODS_PYTHON_VERSION \
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/anki-code/xonsh-install/main/mamba-install-xonsh.sh)"
