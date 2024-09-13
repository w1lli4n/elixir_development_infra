#!/bin/sh

PROJECT_NAME=$1

for i in $(seq 1 $2); do
	podman stop -t 3 $PROJECT_NAME-$i
done

podman ps -a
