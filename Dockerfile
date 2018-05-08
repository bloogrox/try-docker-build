FROM ubuntu:xenial

# ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --assume-yes --no-install-recommends apt-utils
RUN apt-get install -yq \
	lsb-release \
	wget

RUN wget -q http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-4-amd64.deb
RUN dpkg -i couchbase-release-1.0-4-amd64.deb
