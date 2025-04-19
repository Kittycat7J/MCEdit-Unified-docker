#!/bin/bash

xhost +

# VARS
MCDIR="/opt/.minecraft"
INPUTSDIR=$1
if [ -z "$INPUTSDIR" ]; then
  echo "Usage: $0 <path_to_minecraft>"
  exit 1
fi
if [ ! -d "$INPUTSDIR" ]; then
  echo "Error: $INPUTSDIR is not a directory."
  exit 2
fi

set -x

docker build . -f MCEditDockerfile -t mceditunified
docker run --rm -it --pid=host -e DISPLAY=$DISPLAY -v $INPUTSDIR:$MCDIR -v /tmp/.X11-unix:/tmp/.X11-unix:ro mceditunified