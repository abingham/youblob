PIDFILE=/Users/abingham/sandbox/startup_weekend/webshop/lfs-installer/bin/gunicorn.pid

echo $PIDFILE

case "$1" in
    "stop" )
        if [ -f $PIDFILE ]; then
            kill `cat -- $PIDFILE`
            rm -f -- $PIDFILE
        fi    
    ;;
    "" | "fg" )
        if [ -f $PIDFILE ]; then
            kill `cat -- $PIDFILE`
            rm -f -- $PIDFILE
        fi

        if [ "$1" = "fg" ]; then
            /Users/abingham/sandbox/startup_weekend/webshop/lfs-installer/bin/django run_gunicorn 127.0.0.1:8000 --workers=4
        else
            /Users/abingham/sandbox/startup_weekend/webshop/lfs-installer/bin/django run_gunicorn 127.0.0.1:8000 --pid=$PIDFILE --workers=4 --daemon
        fi
esac