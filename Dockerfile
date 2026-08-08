FROM itzg/minecraft-server:java21

ENV EULA=TRUE \
    TYPE=MODRINTH \
    MODRINTH_MODPACK=cobblemon-fabric \
    VERSION=1.21.1 \
    MEMORY=4G \
    USE_AIKAR_FLAGS=true \
    ONLINE_MODE=true \
    MOTD="Cobblemon on Railway" \
    DIFFICULTY=normal \
    MAX_PLAYERS=12 \
    VIEW_DISTANCE=10 \
    SIMULATION_DISTANCE=8 \
    ENABLE_WHITELIST=false

EXPOSE 25565/tcp
VOLUME ["/data"]
