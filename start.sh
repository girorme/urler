#!/bin/bash

#docker build -t urler .
#docker run -it --env-file=.env --rm urler iex -S mix

IMAGE_NAME="urler"
CONTAINER_NAME="urler_container"
DOCKERFILE_PATH="Dockerfile"

# Check if the Docker image exists
if [[ "$(docker images -q $IMAGE_NAME 2>/dev/null)" == "" ]]; then
    echo "Docker image '$IMAGE_NAME' does not exist. Building..."
    docker build -t $IMAGE_NAME -f $DOCKERFILE_PATH .
else
    echo "Docker image '$IMAGE_NAME' already exists."
fi

# Check if the Docker container is already running
if [[ "$(docker ps -q -f name=$CONTAINER_NAME)" == "" ]]; then
    echo "Starting Docker container '$CONTAINER_NAME'..."
    #docker run -d --name $CONTAINER_NAME $IMAGE_NAME
    docker build -t urler .
    docker run -it --env-file=.env --rm urler iex -S mix
else
    echo "Docker container '$CONTAINER_NAME' is already running."
fi