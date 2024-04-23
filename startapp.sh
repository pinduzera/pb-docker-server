#!/bin/sh
cd /pbserver

if [[ -z "${PB_NAME}" ]]; then
export PB_NAME="PBServer"
fi

if [[ -z "${PB_PORT}" ]]; then
export PB_PORT=64640
fi

if [[ -z "${PB_MAX_CLIENTS}" ]]; then
export PB_MAX_CLIENTS=64
fi

if [[ -z "${PB_MAX_ROOMS}" ]]; then
export PB_MAX_ROOMS=32
fi

if [[ -z "${PB_LATENCY_MODE}" ]]; then
export PB_LATENCY_MODE="low"
fi


echo [server] >> PBServerConfig.ini
echo name = $PB_NAME >> PBServerConfig.ini
echo port = $PB_PORT >> PBServerConfig.ini
echo maxClients = $PB_MAX_CLIENTS >> PBServerConfig.ini
echo maxRooms = $PB_MAX_ROOMS >> PBServerConfig.ini
echo latencyMode = $PB_LATENCY_MODE >> PBServerConfig.ini

exec /usr/bin/xterm -e "cd /pbserver; mono Server.exe"
