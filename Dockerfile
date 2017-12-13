FROM alpine:3.7

LABEL maintainer "https://github.com/blacktop"

RUN apk add --no-cache bash bc upx graphviz
RUN apk add --no-cache -t .build-deps \
                          linux-headers \
                          openssl-dev \
                          libpcap-dev \
                          python-dev \
                          geoip-dev \
                          zlib-dev \
                          binutils \
                          fts-dev \
                          cmake \
                          clang \
                          bison \
                          perl \
                          make \
                          flex \
                          git \
                          g++ \
                          fts \
  && cd /tmp \
  && git clone --recursive https://github.com/avast-tl/retdec.git \
  && cd retdec \
  && mkdir build && cd build \
  && mkdir /retdec \
  && cmake .. -DCMAKE_INSTALL_PREFIX=/retdec \
  && make \
  && make install \
  && rm -rf /tmp/* \
  && apk del --purge .build-deps

ENTRYPOINT ["sh"]
