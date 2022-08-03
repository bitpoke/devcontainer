#!/usr/bin/env bash

set -eo pipefail

: "${GOOGLE_CLOUD_SDK_VERSION:=395.0.0}"
: "${GOOGLE_CLOUD_SDK_INSTALL_DIR:=/opt/google-cloud-sdk}"

test -d "${GOOGLE_CLOUD_SDK_INSTALL_DIR}" || mkdir -p "${GOOGLE_CLOUD_SDK_INSTALL_DIR}"

curl -sL https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz | tar -zx -C "${GOOGLE_CLOUD_SDK_INSTALL_DIR}" --strip-components=1
"${GOOGLE_CLOUD_SDK_INSTALL_DIR}/install.sh" -q --rc-path=/etc/bash.bashrc "$@"
