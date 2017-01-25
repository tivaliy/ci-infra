#!/bin/bash

set -e

source ./env.config

# Stops containers and removes containers, networks and volumes
docker-compose down

# Remove docker data volumes if '-f/--force' flag specified
if [[ ( "$1" == "-f" ) || ( "$1" == "--force" ) ]]; then
    echo "Removing data volumes in "${VOLUME_PATH}
    sudo rm -rf ${VOLUME_PATH}
fi
