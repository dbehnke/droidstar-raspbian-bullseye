#!/bin/bash

set +e +x
docker buildx build --platform linux/arm/v7 -t raspbian:bullseye -f Dockerfile-base.armhf .
docker buildx build --platform linux/arm/v7 -t raspbian:bullseye-qtdev -f Dockerfile-qtdev.armhf .
docker buildx build --platform linux/arm/v7 -t raspbian:bullseye-droidstar -f Dockerfile-droidstar.armhf .
