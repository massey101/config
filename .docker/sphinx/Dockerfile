FROM ubuntu:16.04

MAINTAINER "Jack Massey"

ARG userID
ARG username

RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    python3-sphinx \
    python3-setuptools \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Setup our users
# Setup our users
RUN mkdir -p /home/${username} && \
    useradd --uid ${userID} ${username} && \
    echo ${username}:${username} | chpasswd && \
    usermod -a -G sudo ${username} && \
    echo "${username} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${username} && \
    chmod 0440 /etc/sudoers.d/${username} && \
    chown -R ${username}.${username} /home/${username}

USER ${username}
WORKDIR /home/${username}

CMD /bin/bash

