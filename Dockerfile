FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -qy build-essential git libssl-dev m4 yasm autogen automake libtool doxygen python-dev autotools-dev libicu-dev libbz2-dev cmake g++ wget pkg-config libgmp-dev libboost-all-dev


WORKDIR /usr/local/steem
RUN git clone https://github.com/steemit/steem steem-src
WORKDIR /usr/local/steem/steem-src
RUN git fetch --tags
RUN git checkout v0.3.0
RUN git submodule update --init --recursive
RUN cmake -DLOW_MEMORY_NODE=ON -DENABLE_CONTENT_PATCHING=OFF .
RUN make
RUN make install
WORKDIR /usr/local/steem
CMD ["steemd","--rpc-endpoint"]
EXPOSE 8090
