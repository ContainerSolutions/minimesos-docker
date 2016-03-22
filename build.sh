#!/bin/bash

buildVersion() {
  for i in agent master; do
    docker build \
      -t containersol/mesos-${i}:$1 \
      -f $1/agent/Dockerfile \
      . || exit $?
  done
}

docker build \
  -t containersol/alpine3.3-java8-jre:v1 \
  alpine3.3-java8-jre || exit $?

# TODO this should not be "latest"
docker build \
  -t containersol/mesos-base:latest \
  -f base/Dockerfile \
  . || exit $?

buildVersion "0.25.0-0.2.70.ubuntu1404"
buildVersion "0.26.0-0.2.145.ubuntu1404"
buildVersion "0.27.0-0.2.190.ubuntu1404"
buildVersion "0.27.1-2.0.226.ubuntu1404"
