#!/bin/bash

if [ "${MINIMESOS_DOCKER_VERSION}" == "" ]
then
  echo "Please set MINIMESOS_DOCKER_VERSION before building"
  exit 1
fi

echo Pushing containersol/mesos-base:${MINIMESOS_DOCKER_VERSION}
docker push containersol/mesos-base:${MINIMESOS_DOCKER_VERSION} || exit $?

pushImage() {
  MESOS_VERSION=$1
  MESOSPHERE_TAG=$2

  for role in agent master; do
    echo
    echo Pushing containersol/mesos-${role}-${MESOS_VERSION}:${MINIMESOS_DOCKER_VERSION}
    docker push containersol/mesos-${role}-${MESOS_VERSION}:${MINIMESOS_DOCKER_VERSION} || exit $?
    docker push containersol/mesos-${role}-${MESOS_VERSION}:latest || exit $?
  done

}

#            Mesos version  Mesosphere tag
pushImage "0.25.0"       "0.2.70.ubuntu1404"
pushImage "0.26.0"       "0.2.145.ubuntu1404"
pushImage "0.27.0"       "0.2.190.ubuntu1404"
pushImage "0.27.1"       "2.0.226.ubuntu1404"
pushImage "0.28.0"       "2.0.16.ubuntu1404"
pushImage "0.28.1"       "2.0.20.ubuntu1404"

