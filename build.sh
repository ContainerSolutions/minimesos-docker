#!/bin/bash

buildVersion() {
  for role in agent master; do
    echo
    echo Building containersol/mesos-${role}:${1}
    docker build \
      -t containersol/mesos-${role}:${1} \
      -f mesos-image/${role}/Dockerfile \
      --build-arg MESOS_VERSION=${1} \
      . || exit $?
  done
}

docker build \
  -t containersol/alpine3.3-java8-jre:v1 \
  alpine3.3-java8-jre || exit $?

docker build \
  -t containersol/mesos-base:0.1.0 \
  -f base/Dockerfile \
  . || exit $?

buildVersion "0.25.0-0.2.70.ubuntu1404"
buildVersion "0.26.0-0.2.145.ubuntu1404"
buildVersion "0.27.0-0.2.190.ubuntu1404"
buildVersion "0.27.1-2.0.226.ubuntu1404"
buildVersion "0.28.0-2.0.16.ubuntu1404"
buildVersion "0.28.1-2.0.20.ubuntu1404"
