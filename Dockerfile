#############################
# [BUILDER] #################
#############################

FROM ubuntu:bionic as builder

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
  && apt-get install -y $buildDeps bc graphviz upx bash python

RUN echo "===> Install retdec..." \
  && cd /tmp \
  && git clone --recursive https://github.com/avast-tl/retdec.git \
  && cd retdec \
  && mkdir -p build \
  && cd build \
  && cmake .. -DCMAKE_INSTALL_PREFIX=/usr/share/retdec \
  && make \
  && make install

##################
# [RECDEC] #######
##################

FROM ubuntu:bionic

LABEL maintainer "https://github.com/blacktop"

RUN groupadd --gid 1000 retdec \
  && useradd -lm --uid 1000 --gid 1000 --home-dir /usr/share/retdec retdec

RUN apt-get update -q \
  && apt-get install -y bc graphviz upx bash python

COPY --from=builder /usr/share/retdec /usr/share/retdec
RUN chown retdec:retdec /usr/share/retdec

WORKDIR /usr/share/retdec

USER retdec

ENTRYPOINT ["scripts/decompile.sh"]
