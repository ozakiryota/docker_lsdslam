#!/bin/bash

if [ $# -ne 1 ]; then
  exit 1
fi

nvidia-docker run -it --rm \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--device=/dev/video1:/dev/video0 \
	--net=host \
	$1

