#!/bin/bash
set -euo pipefail

marker=/data/.johto-map-v1.3.1-installed

if [[ ! -f "$marker" ]]; then
  echo "Installing Cobblemon Johto v1.3.1 world into persistent storage"

  if [[ -d /data/world && ! -e /data/world-backup-pre-johto ]]; then
    mv /data/world /data/world-backup-pre-johto
  fi

  rm -rf /data/Johto
  cp -a /opt/johto-seed/Johto /data/Johto
  cp /opt/johto-seed/server.properties /data/server.properties
  touch "$marker"
fi

exec /start
