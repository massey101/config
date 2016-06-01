FROM ubuntu:16.04

MAINTAINER "Jack Massey"

ARG userID
ARG username

RUN apt-get update && apt-get install -y \
    sudo \
    python3 \
    python3-setuptools \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --uid ${userID} ${username}
RUN echo ${username}:${username} | chpasswd
RUN adduser ${username} sudo

USER ${username}

CMD /bin/bash
