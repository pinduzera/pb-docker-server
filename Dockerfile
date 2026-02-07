# Pull base image.
FROM mcr.microsoft.com/dotnet/sdk:8.0

# Download Required Packages
RUN apt-get update && \
    apt-get install -y megatools zip && \
    apt-get clean

# Set directory
RUN mkdir -p pbserver
WORKDIR "/pbserver"

# Download the PB Server
RUN megadl https://mega.nz/file/HXBj0RDQ#Rhi8RboNivtuBPcVR9h7FoRfXOflnr1789MwKSN_HqI && \
    unzip powerbomberman078b_server_hotfix3.zip && \
    rm powerbomberman078b_server_hotfix3.zip

# copy entrypoint
COPY entrypoint.sh /entrypoint.sh

# Set directory permission to read/write
RUN chmod -R 777 /pbserver/ && \
    chown -R 1000:1000 /pbserver && \
    chmod 777 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["dotnet", "PBServer2.dll"]
