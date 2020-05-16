FROM ubuntu:20.04

ARG scheme=full

# install basic packages
RUN apt-get update -q && \
    apt-get install -qy \
        build-essential \
        wget \
    && rm -rf /var/liv/apt/lists/*

# copy requisite scripts
COPY setup.sh \
     texlive.profile \
     texlive_pgp_keys.asc \
     /

# run the setup script
RUN /setup.sh ${scheme}

# add texlive to path
ENV PATH="/usr/local/texlive/2020/bin/x86_64-linux:${PATH}"

# customise environment
ENV HOME /data
WORKDIR /data

VOLUME ["/data"]

