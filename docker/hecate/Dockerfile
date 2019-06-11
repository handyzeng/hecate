# Use Ubuntu:16.04 image as parent image
FROM ubuntu:16.04

WORKDIR /

ENV OPENCV_VERSION=3.4.2

# Install necessary library
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install build-essential
RUN apt-get -y install wget cmake git ffmpeg libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

RUN mkdir -p /opt && \
    cd /opt && \
    wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.tar.gz && \
    tar -xvzf ${OPENCV_VERSION}.tar.gz && \
    rm -rf ${OPENCV_VERSION}.tar.gz && \
    wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.tar.gz && \
    tar -xvzf ${OPENCV_VERSION}.tar.gz && \
    rm -rf ${OPENCV_VERSION}.tar.gz && \
    mkdir -p /opt/opencv-${OPENCV_VERSION}/build && \
    cd /opt/opencv-${OPENCV_VERSION}/build && \
    cmake \
      -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D WITH_CUDA=OFF \
      -D BUILD_TESTS=OFF \
      -D BUILD_PERF_TESTS=OFF \
      -D BUILD_EXAMPLES=OFF \
      -D BUILD_ANDROID_EXAMPLES=OFF \
      -D INSTALL_PYTHON_EXAMPLES=OFF \
      -D BUILD_DOCS=OFF \
      -D BUILD_opencv_python2=OFF \
      -D BUILD_opencv_python3=OFF \
      -D BUILD_opencv_apps=OFF \
      -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib-${OPENCV_VERSION}/modules \
      .. && \
      make -j "$(getconf _NPROCESSORS_ONLN)" && \
      make install && \
      ldconfig && \
      rm -rf /opt/opencv-${OPENCV_VERSION} && \
      rm -rf /opt/opencv_contrib-${OPENCV_VERSION}

RUN cd /opt && \
    git clone https://github.com/handyzeng/hecate.git && \
    cd hecate && \
    make && \
    make distribute


