FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -qy build-essential git libssl-dev m4 yasm autogen automake libtool doxygen python-dev autotools-dev libicu-dev libbz2-dev cmake g++ wget pkg-config

#boost from source
WORKDIR /usr/local/steem
RUN wget http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.bz2/download -O boost_1_60_0.tar.bz2
RUN tar jxf boost_1_60_0.tar.bz2
WORKDIR /usr/local/steem/boost_1_60_0
RUN ./bootstrap.sh 
RUN ./b2
RUN ./b2 install
RUN ldconfig
WORKDIR /usr/local/steem
RUN git clone https://github.com/steemit/steem steem-src
WORKDIR /usr/local/steem/steem-src
RUN git submodule update --init --recursive
RUN cmake -DLOW_MEMORY_NODE=ON -DENABLE_CONTENT_PATCHING=OFF .
RUN make
RUN make install
WORKDIR /usr/local/steem
CMD ["steemd","--rpc-endpoint"]
EXPOSE 8090
