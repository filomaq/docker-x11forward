# x11-docker-over-ssh
Use X11 display in any docker rootless container of ssh server

1. Install "socat" (sudo apt install socat).
2. Append "xdocker.sh" to "$HOME/.bashrc" (cat xdocker.sh >> "$HOME/.bashrc").
3. When re-connect to ssh server, if X11 forward enabled, "$HOME/.Xdocker" will created.
4. You can pass $XDOCKER_DISP, $XDOCKER_AUTH, and $XDOCKER_UNIX to your docker container.

Docker run examples
1. docker run -it -e DISPLAY="$XDOCKER_DISP" -v "$XDOCKER_UNIX":/tmp/.X11-unix:ro {image} /bin/bash -c "xauth add $XDOCKER_AUTH; /bin/bash"
2. docker run -it -e DISPLAY="$XDOCKER_DISP" -v "$XDOCKER_UNIX":/tmp/.X11-unix:ro -v $XDOCKER_AUTHFILE:/root/.Xauthority:ro --hostname $XDOCKER_HOSTNAME {image}
