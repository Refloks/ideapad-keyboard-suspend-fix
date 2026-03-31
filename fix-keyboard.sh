#!/bin/sh
if [ "$1" = "post" ]; then
    echo i8042 > /sys/bus/platform/drivers/i8042/unbind
    sleep 0.5
    echo i8042 > /sys/bus/platform/drivers/i8042/bind
fi
