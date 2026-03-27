#!/bin/sh
while true; do
    state=$(cat /proc/acpi/button/lid/LID/state)
    if echo "$state" | grep -q "closed"; then
        systemctl suspend
        sleep 5
    fi
    sleep 1
done
