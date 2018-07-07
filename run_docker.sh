#!/bin/bash

if [ $# -ne 1 ]; then
  exit 1
fi

xhost +

#docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) --build-arg USERNAME=${USER} -t test1:latest .

nvidia-docker run -it --rm \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--device=/dev/video1:/dev/video0 \
	test1:latest \


