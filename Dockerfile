FROM ubuntu:14.04
MAINTAINER Container Solutions BV <info@container-solutions.com>

ENV VERSION "0.25.0-0.2.70.ubuntu1404"

RUN echo "deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu trusty main" > /etc/apt/sources.list.d/openjdk.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv 86F44E2A && \
  apt-get update && \
  apt-get -y install openjdk-8-jre-headless && \
  rm -rf /var/lib/apt/lists/*

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
RUN apt-get -y update
RUN apt-get -y install mesos=${VERSION}

RUN  rm -rf /var/lib/apt/lists/*
