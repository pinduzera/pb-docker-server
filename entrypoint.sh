#!/bin/sh
cd /pbserver

# Set defaults if not already defined
if [ -z "$PB_NAME" ]; then
    export PB_NAME="PBServer"
fi

if [ -z "$PB_PORT" ]; then
    export PB_PORT=64640
fi

if [ -z "$PB_MAX_ROOMS" ]; then
    export PB_MAX_ROOMS=32
fi

if [ -z "$PB_WELCOME_MESSAGE" ]; then
    export PB_WELCOME_MESSAGE="Welcome to PBDocker!"
fi

if [ -z "$PB_VERBOSE" ]; then
    export PB_VERBOSE="false"
fi

if [ -z "$PB_LOGGING" ]; then
    export PB_LOGGING="false"
fi

cat > PBServer2Config.json <<EOF
{
    "ServerName": "$PB_NAME",
    "ServerPort": $PB_PORT,
    "WelcomeMessage": "$PB_WELCOME_MESSAGE",
    "MaxRooms": $PB_MAX_ROOMS,
    "Verbose": "$PB_VERBOSE",
    "FileLogging": "$PB_LOGGING"
}
EOF

exec "$@"