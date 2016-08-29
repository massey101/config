FROM 192.168.100.93:5000/j4media:native

MAINTAINER "Jack Massey"

ARG userID
ARG username

RUN dnf install -y \
    iputils \
    nc && \
    dnf clean all

# USER builder
# WORKDIR /home/builder
# 
# CMD /bin/bash
