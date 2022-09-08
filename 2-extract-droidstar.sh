#!/bin/bash

docker run --platform linux/armhf -v $PWD:/export -it raspbian:bullseye-droidstar /export/exportdeb.sh
