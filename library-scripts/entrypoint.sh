#!/usr/bin/env bash

set -eo pipefail

sudo chown gitpod:gitpod /workspace

if [ -n "${GITPOD_WORKSPACE_ID}" ] ; then
    exec "${@}"
fi

exec /usr/local/share/library-scripts/start-docker-in-docker.sh "${@}"