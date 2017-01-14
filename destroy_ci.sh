#!/bin/bash

set -e

source ./env.config

# Stops containers and removes containers, networks and volumes
docker-compose down
