#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "define agent_path and img name"
    exit 1
fi

echo "agent_path: $1"
echo "img name: $2"
AGENT_PATH=$1
AGENT_IMG_NAME=$2

cd ../..
docker pull ubuntu:20.04
echo TeamCity/webapps > context/.dockerignore
echo TeamCity/devPackage >> context/.dockerignore
echo TeamCity/lib >> context/.dockerignore
docker build --build-arg agent_path=$AGENT_PATH -f "context/generated/linux/MinimalAgent/Ubuntu/20.04/Dockerfile_customdir" -t teamcity-minimal-agent:EAP-linux "context"
echo 2> context/.dockerignore
echo TeamCity >> context/.dockerignore
docker build -f "context/generated/linux/Agent/Ubuntu/20.04/Dockerfile" -t $AGENT_IMG_NAME "context"
