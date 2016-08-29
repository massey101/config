FROM ubuntu:16.04

MAINTAINER "Jack Massey"

ARG userID
ARG username

RUN apt-get update && apt-get install -y \
    sudo \
    build-essential

RUN apt-get update && apt-get install -y \
    git \
    curl \
    python \
    dh-autoreconf

# Install git repo
COPY repo /bin/repo
COPY sdk /sdk

RUN /sdk/fsl-imx-fb-glibc-x86_64-fsl-image-qt5-cortexa7hf-vfp-neon-toolchain-3.14.52-1.1.0.sh -y
RUN rm -rf /sdk

# Setup python link
RUN ln -s /usr/bin/python /bin/python

# Setup our users
RUN useradd --uid ${userID} ${username}
RUN echo ${username}:${username} | chpasswd
RUN usermod -a -G sudo ${username}

USER ${username}

CMD /bin/bash
