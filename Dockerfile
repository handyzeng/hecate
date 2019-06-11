# Use Ubuntu:16.04 image as parent image
FROM ubuntu:16.04

# Modify apt-get to aliyun mirror
WORKDIR /
#RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list

# Install necessary library
RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get -y install wget cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

RUN wget https://github.com/opencv/opencv/archive/3.4.2.tar.gz && \
    tar -xvzf 3.4.2.tar.gz && \
    cd opencv-3.4.2/  && \
    mkdir build && \
    cd build && \
    cmake -D WITH_CUDA=off -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. && \
    make -j$(nproc) && \
    make install