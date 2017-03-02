# minimesos-docker

## Docker images for minimesos

This repo contains the Mesos-based Docker images used by [minimesos](https://github.com/containersolutions/minimesos)

## Versioning

The version number pattern is `${MESOS_VERSION}-${MINIMESOS_DOCKER_VERSION}`.

For example, in the snippet below we see the `containersol/mesos-agent`'s Apache Mesos version is 1.0.0 and its minimesos-docker version is
`0.2.0`.

```
$ docker images | grep mesos-agent
  containersol/mesos-agent                                 1.0.0-0.2.0                 871b5d30243e        About a minute ago   615.3 MB
  ...
```

## Changelog

See the [CHANGELOG](./CHANGELOG.md) for the latest changes in each minimesos-docker version.

## Contact Us

* @minimesos
* @Frank_Scholten
* @Containersoluti
