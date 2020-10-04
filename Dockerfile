FROM ubuntu:focal

ARG DEBIAN_FRONTEND="noninteractive"
ENV TZ=America/New_York

RUN mkdir /build
WORKDIR /build

RUN apt update && apt install -y \
      debhelper \
      git \
      libcapture-tiny-perl \
      libconfig-inifiles-perl \
      pv \
      lzop \
      mbuffer && \
    # Download the repo 
    git clone https://github.com/jimsalterjrs/sanoid.git && \
    cd sanoid && \
    # checkout latest stable release or stay on master for bleeding edge stuff (but expect bugs!)
    git checkout $(git tag | grep "^v" | tail -n 1) && \
    ln -s packages/debian . && \
    dpkg-buildpackage -uc -us
  # && \
  # dpkg-buildpackage -uc -us && \
  # mkdir /build && \
  # cp *.deb /build/sanoid.deb