#!/bin/bash
set -e

source ./env.config

# Makes /your/home/jenkins_volume is accessible by the
# jenkins user in container (jenkins user - uid 1000)
sudo mkdir -p ${VOLUME_PATH}/jenkins_volume
sudo chown 1000 ${VOLUME_PATH}/jenkins_volume

docker-compose $@