FROM land007/debian:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN apt-get install -y build-essential git

RUN cd /tmp && wget https://github.com/google/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.tar.gz
RUN cd /tmp && tar -zxvf protobuf-all-3.6.1.tar.gz
RUN cd /tmp/protobuf-3.6.1 && ./configure && make && make check && make install
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

RUN apt-get install -y --no-install-recommends libgflags-dev libboost-all-dev
RUN cd /tmp/ && wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/google-glog/glog-0.3.3.tar.gz && tar -zxvf glog-0.3.3.tar.gz
RUN cd /cd /tmp/glog-0.3.3/ && ./configure && make && make install

#ADD c++.tar.gz /cpp
#RUN ls /cpp
#RUN cd /cpp/face_client && make clean && make

#docker stop cpp-grpc ; docker rm cpp-grpc ; docker run -it --privileged --name cpp-grpc land007/cpp-grpc:latest
