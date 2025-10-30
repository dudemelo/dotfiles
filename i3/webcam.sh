#!/bin/bash

v4l2-ctl -d /dev/video1 --set-parm=30 \
    && v4l2-ctl -d /dev/video1 --set-ctrl=backlight_compensation=1 \
    && v4l2-ctl -d /dev/video1 --set-ctrl=focus_automatic_continuous=0 \
    && v4l2-ctl -d /dev/video1 --set-ctrl=focus_absolute=24
