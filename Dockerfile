# Pull base image.
FROM jlesage/baseimage-gui:debian-11

# Set the name of the application.
ENV APP_NAME="PBServer"

# Download Required Packages
RUN apt-get update && \
    apt-get install -y megatools zip mono-devel xterm && \
    apt-get clean

# Set directory
RUN mkdir -p pbserver
WORKDIR "/pbserver"

# Download the PB Server
RUN megadl https://mega.nz/file/mPZSgS4T#3vnm7zR2Tz3ZANt0tnFaorMy4f7j9cpVjgRvMQI0qeo && \
    unzip powerbomberman077c_server.zip && \
    rm powerbomberman077c_server.zip

# Set directory permission to read/write
RUN chmod -R 777 /pbserver/ && \
    chown -R 1000:1000 /pbserver

# copy entrypoint
COPY startapp.sh /startapp.sh


