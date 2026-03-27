#!/bin/sh
echo i8042 > /sys/bus/platform/drivers/i8042/unbind
echo i8042 > /sys/bus/platform/drivers/i8042/bind
echo serio1 > /sys/bus/serio/drivers/atkbd/unbind
