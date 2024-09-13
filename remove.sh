#!/bin/sh

PROJECT_NAME=$1

for i in $(seq 1 $2); do
	podman rm $PROJECT_NAME-$i
	podman volume rm $PROJECT_NAME-volume-$i
	rm -rf .$PROJECT_NAME-$i
done

podman network rm $PROJECT_NAME-network

podman ps
podman volume ls
podman network ls
