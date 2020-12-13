#!/usr/bin/env bash

# Stop all running containers
docker container stop $(docker container ls -aq)

# Remove the stopped containers
docker container ls -a | cut -d ' ' -f1 | grep -v CONTAINER | xargs docker container rm

# Prune.  If there is no container, then remove the image.
docker image prune -a -f
