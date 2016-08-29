FROM ubuntu:14.04

MAINTAINER "Jack Massey"

RUN apt-get update && apt-get install -y \
    sudo \
    libgfortran3 \
    libgl1-mesa-dev \
    python3-dev \
    python3-pyqt5 \
    && rm -rf /var/lib/apt/lists/*

ADD Cura-2.1.3-Linux.deb /tmp
RUN dpkg -i /tmp/Cura-2.1.3-Linux.deb

ARG userID
ARG username

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

CMD "cura"
