#!/usr/bin/env bash

# Deploy in detached mode
# We can use the latest, but we need to clean the environment first.
#docker container run -d --name webappcontainer -p 8080:80 rgranier/webapprepo:v1.3
docker container run -d --name webappcontainer -p 8080:80 rgranier/webapprepo:latest

# List the containers
echo ""
docker container ls

# List the images
echo ""
docker image ls
