FROM ubuntu:16.04

MAINTAINER "Jack Massey"

ARG userID
ARG username

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    sudo \
    python3 \
    python3-setuptools \
    python3-pip \
    # Packages here
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pep8

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

ENTRYPOINT [ "pep8" ]
