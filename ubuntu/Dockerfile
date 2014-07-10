# docker build -t osdakira/ubuntu:1.0  ./ubuntu/
FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN echo "apt-get update"
RUN apt-get update
RUN apt-get -y dist-upgrade

RUN echo "base"
RUN apt-get install -y --force-yes build-essential curl git-core openssl
RUN apt-get install -y --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

RUN echo "nginx"
RUN apt-get install -y --force-yes nginx

RUN echo "mysql"
RUN apt-get install -y --force-yes mysql-server mysql-client libmysqlclient-dev

RUN echo "apt-get clean"
RUN apt-get clean
