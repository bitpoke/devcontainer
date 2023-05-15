#!/usr/bin/env bash

set -eo pipefail

curl -sL -o /tmp/percona.deb "https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb"
dpkg -i /tmp/percona.deb
rm /tmp/percona.deb
percona-release setup ps57
apt install -y percona-server-client-5.7
