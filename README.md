# Cobblemon server on Railway

A persistent Minecraft: Java Edition server running the official Cobblemon Fabric modpack.

## Railway setup

1. In the Railway project `triumphant-upliftment`, create a **new service** from this GitHub repository. Do not attach this repository to an existing service.
2. Add a Railway volume to the new service and mount it at `/data`. The world, configuration, player data, whitelist, and operator list live there.
3. Under the service's Networking settings, create a **TCP Proxy** targeting port `25565`.
4. Give the service enough memory. The image defaults to a 4 GB JVM heap, so provision more than 4 GB total container memory. For a larger group, set `MEMORY=6G` or higher and increase the Railway memory allocation accordingly.
5. Deploy and wait for the log line indicating the Minecraft server has finished starting.
6. Connect with the TCP proxy hostname and port Railway provides.

## Client setup

Every player needs Minecraft: Java Edition and the matching [Cobblemon Official Modpack (Fabric)](https://modrinth.com/modpack/cobblemon-fabric) for Minecraft 1.21.1.

## Configuration

The Dockerfile supplies safe defaults. Override them with Railway service variables when needed:

| Variable | Default | Purpose |
| --- | --- | --- |
| `MEMORY` | `4G` | Java maximum heap |
| `MOTD` | `Cobblemon on Railway` | Multiplayer server description |
| `DIFFICULTY` | `normal` | Minecraft difficulty |
| `MAX_PLAYERS` | `12` | Player limit |
| `VIEW_DISTANCE` | `10` | Server view distance |
| `SIMULATION_DISTANCE` | `8` | Tick simulation distance |
| `ENABLE_WHITELIST` | `false` | Enables the Minecraft whitelist |
| `WHITELIST` | empty | Comma-separated Minecraft usernames |
| `OPS` | empty | Comma-separated operator usernames |

The server uses Mojang/Microsoft online authentication by default. Keep `ONLINE_MODE=true` unless you fully understand the security implications.

## Backups and updates

Back up the Railway volume before changing modpack versions. The image resolves the current compatible Modrinth release at startup; pin `MODRINTH_VERSION` as a Railway variable if you need reproducible upgrades.

## License notice

By deploying this server, you accept the [Minecraft EULA](https://aka.ms/MinecraftEULA). Cobblemon and the included mods retain their respective licenses.
