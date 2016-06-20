FROM perl
MAINTAINER Siddhartha Basu<siddhartha-basu@northwestern.edu>

# Install postgres client
RUN apt-get update \ 
    && apt-get -y install postgresql-client curl vim git \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* 

ARG curruid
ARG user
ADD cpanfile /tmp/
RUN cd /tmp \
    && cpanm -n --quiet --installdeps . \
# Add an user that will be used for install purpose
    && useradd -m -s /bin/bash -c "Docker image user" -u $curruid $user 
USER $user
# Source code folder will be the default landing spot
WORKDIR /usr/src/chado-sqitch

