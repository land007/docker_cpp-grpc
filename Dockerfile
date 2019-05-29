FROM land007/ubuntu-build-codemeter:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN cd /tmp && wget https://github.com/google/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.tar.gz && tar -zxvf protobuf-all-3.6.1.tar.gz && rm -f /tmp/protobuf-all-3.6.1.tar.gz
RUN cd /tmp/protobuf-3.6.1 && ./configure && make && make check && make install && rm -rf /tmp/protobuf-3.6.1
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /etc/profile

RUN cd /tmp/ && git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc
RUN cd /tmp/grpc && git submodule update --init
RUN cd /tmp/grpc && make && make install && rm -rf /tmp/grpc

RUN echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times
RUN echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time
RUN echo "land007/cpp-grpc" >> /.image_names
RUN echo "land007/cpp-grpc" > /.image_name

#docker stop cpp-grpc ; docker rm cpp-grpc ; docker run -it --privileged --name cpp-grpc land007/cpp-grpc:latest
