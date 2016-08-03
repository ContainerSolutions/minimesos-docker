#!/usr/bin/env bash

# Use this script to list all mesos ubuntu package versions

docker build -t package-list .
docker run package-list apt-cache show mesos | grep Version
