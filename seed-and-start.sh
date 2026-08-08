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

# World archives can contain stale lock files and read-only ownership metadata.
# The Minecraft image runs the game as its default uid/gid 1000.
rm -f /data/Johto/session.lock /data/Johto/DIM-1/session.lock /data/Johto/DIM1/session.lock
chown -R 1000:1000 /data/Johto /data/server.properties "$marker"
chmod -R u+rwX /data/Johto

exec /start
