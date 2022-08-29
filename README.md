# x11-docker
Use X11 display in docker container of ssh server

1. Install "socat".
2. Append "xdocker.sh" to "$HOME/.bashrc".
3. When re-connect to ssh server, if X11 forward enabled, "$HOME/.Xdocker" will created.
4. You can pass $XDOCKER_DISP, $XDOCKER_AUTH, and $XDOCKER_UNIX to your docker container.
EX) docker run -it -e DISPLAY="$XDOCKER_DISP" -v "$XDOCKER_UNIX":/tmp/.X11-unix:ro {image} /bin/bash -c "xauth add $XDOCKER_AUTH; /bin/bash"
