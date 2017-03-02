FROM containersol/mesos-base:0.1.0
MAINTAINER Container Solutions BV <info@container-solutions.com>

ARG MESOS_VERSION

ENV VERSION ${MESOS_VERSION}
ENV GLOG_v 2

ENV CNI_VERSION v0.3.0
ENV MESOS_NETWORK_CNI_CONFIG_DIR /var/lib/mesos/cni/config
ENV MESOS_NETWORK_CNI_PLUGINS_DIR /var/lib/mesos/cni/plugins

RUN echo "deb http://repos.mesosphere.com/ubuntu trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get update && \
    apt-get -y install mesos=${VERSION} && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p $MESOS_NETWORK_CNI_CONFIG_DIR
RUN mkdir -p $MESOS_NETWORK_CNI_PLUGINS_DIR

RUN curl -L https://github.com/containernetworking/cni/releases/download/${CNI_VERSION}/cni-${CNI_VERSION}.tgz --output cni-${CNI_VERSION}.tgz
RUN tar xvzf cni-$CNI_VERSION.tgz

RUN mv bridge $MESOS_NETWORK_CNI_PLUGINS_DIR/bridge
RUN mv host-local $MESOS_NETWORK_CNI_PLUGINS_DIR/host-local
ADD cni-host-local.conf $MESOS_NETWORK_CNI_CONFIG_DIR/cni-host-local.conf

ENTRYPOINT ["mesos-slave", "--network_cni_plugins_dir=/var/lib/mesos/cni/plugins", "--network_cni_config_dir=/var/lib/mesos/cni/config", "--no-hostname_lookup"]