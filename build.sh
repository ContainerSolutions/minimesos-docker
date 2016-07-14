#!/bin/bash

if [ "${MINIMESOS_DOCKER_VERSION}" == "" ]
then
  echo "Please set MINIMESOS_DOCKER_VERSION before building"
  exit 1
fi

buildImage() {
  MESOS_VERSION=$1
  MESOSPHERE_TAG=$2

  for role in agent master; do
    echo
    echo Building containersol/mesos-${role}-${MESOS_VERSION}:${MINIMESOS_DOCKER_VERSION}
    docker build \
      -t containersol/mesos-${role}-${MESOS_VERSION}:${MINIMESOS_DOCKER_VERSION} \
      -f mesos-image/${role}/Dockerfile \
      --build-arg MESOS_VERSION=${MESOS_VERSION}-${MESOSPHERE_TAG} \
      . || exit $?
    docker build \
      -t containersol/mesos-${role}-${MESOS_VERSION}:latest \
      -f mesos-image/${role}/Dockerfile \
      --build-arg MESOS_VERSION=${MESOS_VERSION}-${MESOSPHERE_TAG} \
      . || exit $?
  done
}

docker build \
  -t containersol/alpine3.3-java8-jre:v1 \
  alpine3.3-java8-jre || exit $?

docker build \
  -t containersol/mesos-base:${MINIMESOS_DOCKER_VERSION} \
  -f base/Dockerfile \
  . || exit $?

#          Mesos version  Mesosphere tag
buildImage "0.25.0"       "0.2.70.ubuntu1404"
buildImage "0.26.0"       "0.2.145.ubuntu1404"
buildImage "0.27.0"       "0.2.190.ubuntu1404"
buildImage "0.27.1"       "2.0.226.ubuntu1404"
buildImage "0.28.0"       "2.0.16.ubuntu1404"
buildImage "0.28.1"       "2.0.20.ubuntu1404"
