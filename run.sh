#!/bin/bash

base_dir=$HOME/firefox-java

install() {
  docker rmi firefox-java
  docker build --build-arg MY_UID=$(id -u) -t firefox-java $(dirname $0)
  [ $? -eq 0 ] && mkdir "$base_dir"
}

launch() {
  docker run --rm -d \
  --net host \
  --env="DISPLAY" \
  --mount type=bind,source="$base_dir",target=/firefox \
  --mount type=bind,source="$HOME/.Xauthority",target=/firefox/.Xauthority \
  --mount type=bind,source=/tmp/.X11-unix,target=/tmp/.X11-unix \
  --mount type=bind,source=/dev/shm,target=/dev/shm \
  --mount type=bind,source=/etc/fonts,target=/etc/fonts \
  --mount type=bind,source=/usr/share/fonts,target=/usr/share/fonts \
  firefox-java
}

[ ! -d "$base_dir" ] && install
[ -d "$base_dir" ] && launch
