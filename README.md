# docker-retdec

[![CircleCI](https://circleci.com/gh/blacktop/docker-retdec.png?style=shield)](https://circleci.com/gh/blacktop/docker-retdec) [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org) [![Docker Stars](https://img.shields.io/docker/stars/blacktop/retdec.svg)](https://hub.docker.com/r/blacktop/retdec/) [![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/retdec.svg)](https://hub.docker.com/r/blacktop/retdec/) [![Docker Image](https://img.shields.io/badge/docker%20image-4.39GB-blue.svg)](https://hub.docker.com/r/blacktop/retdec/)

This repository contains a **Dockerfile** of [RetDec](https://github.com/avast-tl/retdec) **blacktop/retdec**.

--------------------------------------------------------------------------------

## Dependencies

- [ubuntu:bionic](https://hub.docker.com/r/_/ubuntu/)

## Image Tags

```bash
$ docker images

REPOSITORY          TAG           SIZE           Compressed Size
blacktop/retdec     latest        4.39GB         414MB
```

## Installation

1. Install [Docker](https://docs.docker.com).
2. Download [trusted build](https://hub.docker.com/r/blacktop/retdec/) from public [Docker Registry](https://hub.docker.com): `docker pull blacktop/retdec`

## Getting Started

```bash
$ docker run --rm -v `pwd`:/samples blacktop/retdec FILE
```

## Issues

Find a bug? Want more features? Find something missing in the documentation? Let me know! Please don't hesitate to [file an issue](https://github.com/blacktop/docker-retdec/issues/new).

## License

MIT Copyright (c) 2018 **blacktop**
