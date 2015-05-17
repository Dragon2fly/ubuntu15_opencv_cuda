#!/usr/bin/env bash
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo apt-get install synaptic vlc y-ppa-manager openjdk-7-jre unace unrar zip unzip p7zip-full p7zip-rar rar

sudo apt-get install python-numpy python3-numpy python-pip python3-pip
sudo apt-get install python-pycuda python-pyopencl

sudo apt-get install nvidia-modprobe

sudo apt-get -y install libopencv-dev build-essential cmake git libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip

sudo su
ln -s /usr/lib/nvidia-346/libnvcuvid.so /usr/lib/libnvcuvid.so && ln -s /usr/lib/nvidia-346/libnvcuvid.so.1 /usr/lib/libnvcuvid.so.1

git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv
mkdir build
cd build/

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_CUBLAS=ON -D WITH_NVCUVID=ON -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 -D OPENCV_EXTRA_MODULES_PATH=/home/opencv_contrib/modules ..

make -j6
sudo make install