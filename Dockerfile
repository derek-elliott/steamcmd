FROM ubuntu:17.10

RUN apt update \
    && apt install -y \
    apt-utils \
    net-tools \
    wget \
    ca-certificates \
    lib32gcc1 \
    lib32stdc++6 \
    lib32z1 \
    lib32z1-dev

ARG STEAM_HOME=/home/steam
ARG STEAMCMD_URL=https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz

RUN useradd steam \
    && mkdir -p ${STEAM_HOME}/Steam \
    && chown -R steam:steam $STEAM_HOME

USER steam
WORKDIR $STEAM_HOME/Steam

RUN wget $STEAMCMD_URL \
    && tar -zxvf steamcmd_linux.tar.gz \
    && rm steamcmd_linux.tar.gz

ENTRYPOINT ["./steamcmd.sh"]
