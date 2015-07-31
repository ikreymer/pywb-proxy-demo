#!/bin/bash

DIR=$(dirname $0)
PORT=8080

docker run -it -p $PORT:8080 -v $DIR:/webarchive ikreymer/pywb
