FROM ubuntu:16.04

MAINTAINER "Jack Massey"

ARG userID
ARG username

RUN apt-get update && apt-get install -y \
    sudo \
    python3 \
    python3-pip \
    libglib2.0-dev \
    libxext-dev \
    libglu1-mesa-dev \
    libegl1-mesa-dev \
    libfontconfig-dev \
    libxrender-dev \
    libxi-dev \
    libsm-dev \
    libdbus-1-dev \
    openssh-server \
    python3-pyqt5 \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pyqt5 netifaces

RUN service ssh start

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
