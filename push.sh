#!/bin/bash

echo Pushing containersol/mesos-base:0.1.0
docker push containersol/mesos-base:0.1.0 || exit $?

pushImage() {
  for role in agent master; do
    echo
    echo Pushing containersol/mesos-${role}:${1}
    docker push containersol/mesos-${role}:${1} || exit $?
  done
}

pushImage "0.25.0-0.2.70.ubuntu1404"
pushImage "0.26.0-0.2.145.ubuntu1404"
pushImage "0.27.0-0.2.190.ubuntu1404"
pushImage "0.27.1-2.0.226.ubuntu1404"
pushImage "0.28.0-2.0.16.ubuntu1404"
pushImage "0.28.1-2.0.20.ubuntu1404"

