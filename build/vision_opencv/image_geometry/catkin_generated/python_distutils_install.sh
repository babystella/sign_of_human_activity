#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/Tianshu/score_ws/src/vision_opencv/image_geometry"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/Tianshu/score_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/Tianshu/score_ws/install/lib/python3/dist-packages:/home/Tianshu/score_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/Tianshu/score_ws/build" \
    "/home/Tianshu/anaconda3/envs/myenv/bin/python3.6" \
    "/home/Tianshu/score_ws/src/vision_opencv/image_geometry/setup.py" \
     \
    build --build-base "/home/Tianshu/score_ws/build/vision_opencv/image_geometry" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/Tianshu/score_ws/install" --install-scripts="/home/Tianshu/score_ws/install/bin"
