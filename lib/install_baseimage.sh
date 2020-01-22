#!/bin/bash

#This is for base tag of image syneblock/quorum-master:base
apt-get update
apt-get install -y \
    libdb-dev \
    libleveldb-dev \
    libsodium-dev \
    zlib1g-dev \
    libtinfo-dev \
    software-properties-common \
    python-software-properties \
    build-essential \
    wget \
    curl \
    jq \
    psmisc \
    iputils-ping \
    bsdmainutils \
    openjdk-8-jdk \
    maven \
    net-tools
add-apt-repository ppa:ethereum/ethereum -y
apt-get update
apt-get install -y solc
apt-get clean
rm -rf /var/lib/apt/lists/*
