# X11 Docker Over SSH
XDOCKER_DISP_NUM=$(echo $DISPLAY | grep -o "^localhost\:[0-9]\+" | grep -o "[0-9]\+")
if [ -n "${XDOCKER_DISP_NUM}" ]; then
        XDOCKER_UNIX_DIR=$HOME/.Xdocker
        XDOCKER_UNIX_FILE=$XDOCKER_UNIX_DIR/X$XDOCKER_DISP_NUM
        XDOCKER_DISP_PORT=$(expr $XDOCKER_DISP_NUM + 6000)

        mkdir -p -m 777 $XDOCKER_UNIX_DIR
        shopt -s huponexit
        if [ ! -S "$XDOCKER_UNIX_FILE" ]; then
                socat UNIX-LISTEN:$XDOCKER_UNIX_FILE,mode=777,fork TCP:localhost:$XDOCKER_DISP_PORT &
        fi

        export XDOCKER_DISP=:$XDOCKER_DISP_NUM
        export XDOCKER_AUTH=$XDOCKER_DISP$(xauth list $DISPLAY | grep -o "\s\+.\+")
        export XDOCKER_UNIX=$XDOCKER_UNIX_DIR
fi
