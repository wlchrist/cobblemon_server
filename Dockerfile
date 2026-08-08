FROM itzg/minecraft-server:java21

COPY Johto /opt/johto-seed/Johto
COPY server.properties /opt/johto-seed/server.properties
COPY seed-and-start.sh /seed-and-start.sh

RUN chmod +x /seed-and-start.sh

ENV EULA=TRUE \
    TYPE=MODRINTH \
    MODRINTH_MODPACK=cobblemon-fabric \
    VERSION=1.21.1 \
    MEMORY=4G \
    USE_AIKAR_FLAGS=true \
    ONLINE_MODE=true \
    LEVEL=Johto \
    ENABLE_COMMAND_BLOCK=true \
    OPS=warrenchrist

EXPOSE 25565/tcp

ENTRYPOINT ["/seed-and-start.sh"]
