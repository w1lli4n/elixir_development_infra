#!/bin/sh

PROJECT_NAME=$1
VOLUME_NAME=$PROJECT_NAME-volume
NETWORK_NAME=$PROJECT_NAME-network

podman network create $NETWORK_NAME

for i in $(seq 1 $2); do
	DIR=.$PROJECT_NAME-$i
	VOLUME=$VOLUME_NAME-$i
	NAME=$PROJECT_NAME-$i
	PORT=400$i

	mkdir $DIR 
	
	cp -R lib/ mix.exs mix.lock entrypoint.sh $DIR

	podman run -dt -e COOKIE=secret --cap-add=NET_RAW --network $NETWORK_NAME -v $VOLUME:/root/.mix -v $DIR:/app:Z -w /app --name $NAME -h $NAME -p $PORT:4000 elixir:latest bash -c "chmod +x /app/entrypoint.sh && ./entrypoint.sh"
done

podman ps
podman volume ls
podman network ls
