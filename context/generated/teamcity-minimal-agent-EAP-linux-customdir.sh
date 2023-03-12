#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "define agent_path"
    exit 1
fi

echo "agent_path: $1"


cd ../..
docker pull ubuntu:20.04
echo TeamCity/webapps > context/.dockerignore
echo TeamCity/devPackage >> context/.dockerignore
echo TeamCity/lib >> context/.dockerignore

#AGENT_PATH=/opt/buildagent
AGENT_PATH=$1
AGENT_IMG_NAME=tc-minimal-agent0

docker build --build-arg agent_path=$AGENT_PATH -f "context/generated/linux/MinimalAgent/Ubuntu/20.04/Dockerfile_customdir" -t $AGENT_IMG_NAME "context"
