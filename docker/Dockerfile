# Copyright Waterford Institute of Technology 2017~2019
# Telecommunications Software and Systems Group (TSSG)
# Author Miguel Ponce de Leon <miguelpdl@tssg.org>
#
# Using phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:master
MAINTAINER Miguel Ponce de Leon <miguelpdl@tssg.org>
ENV build_date 2019-10-04

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
RUN apt-get update --fix-missing && apt-get upgrade -y

RUN apt-get install git build-essential libsqlite3-dev default-jdk swig -y

WORKDIR /opt

#Setting up the command line argument to pass in gituser access_token
ARG gituser
ARG access_token

RUN git clone https://$gituser:$access_token@servo.tssg.org/re-serve/development/libiec61850.git

WORKDIR /opt/libiec61850

RUN make examples

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
