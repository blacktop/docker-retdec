FROM ubuntu:bionic

LABEL maintainer "https://github.com/blacktop"

RUN buildDeps='ca-certificates \
               build-essential \
               libtinfo-dev \
               zlib1g-dev \
               pkg-config \
               autoconf \
               git-core \
               libtool \
               cmake \
               bison \
               flex \
               wget \
               m4' \
  && set -x \
  && apt-get update -q \
  && apt-get install -y $buildDeps bc graphviz upx bash python --no-install-recommends \
  && echo "===> Install retdec..." \
  && cd /tmp \
  && git clone --recursive https://github.com/avast-tl/retdec.git \
  && cd retdec \
  && mkdir build /retdec \
  && cd build \
  && cmake .. -DCMAKE_INSTALL_PREFIX=/retdec \
  && make \
  && make install \
  && echo "===> Clean up unnecessary files..." \
  && apt-get purge -y --auto-remove $buildDeps $(apt-mark showauto) \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives /tmp/* /var/tmp/*

WORKDIR /retdec

ENTRYPOINT ["bash"]
