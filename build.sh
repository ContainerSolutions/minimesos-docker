#! /bin/sh

VERSION=0.25.0-0.2.70.ubuntu1404

docker build -t containersol/minimesos-parent:${VERSION} mesos-parent
docker build -t containersol/mesos-master:${VERSION} master
docker build -t containersol/mesos-agent:${VERSION} agent

docker build -t containersol/jre8-docker jre8-docker
