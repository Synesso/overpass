FROM ubuntu:xenial
MAINTAINER Jem Mawson <jemmawson@gmail.com>

RUN apt-get update
RUN apt-get -y install wget g++ make expat libexpat1-dev zlib1g-dev build-essential automake
RUN wget http://dev.overpass-api.de/releases/osm-3s_v0.7.52.tar.gz
RUN gunzip <osm-3s_v0.7.52.tar.gz | tar xvf -
WORKDIR osm-3s_v0.7.52
RUN ./configure --prefix="`pwd`" && make CXXFLAGS="-O3"
RUN mkdir -p db && bin/download_clone.sh --source=http://dev.overpass-api.de/api_drolbr/ --db-dir="db/" --meta=no
