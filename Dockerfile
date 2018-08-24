FROM land007/ubuntu:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN apt-get install -y build-essential git
#RUN sudo yum install glibc-headers gcc-c++

RUN cd /tmp && wget https://github.com/google/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.tar.gz
RUN cd /tmp && tar -zxvf protobuf-all-3.6.1.tar.gz
RUN cd /tmp/protobuf-3.6.1 && ./configure && make && make check && make install
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

RUN cd /tmp/ && git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc
RUN cd /tmp/grpc && git submodule update --init
RUN cd /tmp/grpc && make && make install


#docker stop cpp-grpc ; docker rm cpp-grpc ; docker run -it --privileged --name cpp-grpc land007/cpp-grpc:latest
