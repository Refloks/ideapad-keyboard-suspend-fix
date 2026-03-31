#!/bin/sh
set -e

cp fix-keyboard.sh /usr/lib/systemd/system-sleep/fix-keyboard
chmod +x /usr/lib/systemd/system-sleep/fix-keyboard

cp lid-watch.sh /usr/local/bin/lid-watch.sh
chmod +x /usr/local/bin/lid-watch.sh
cp lid-watch.service /etc/systemd/system/lid-watch.service
systemctl daemon-reload
systemctl enable --now lid-watch.service

# Remove old fix-keyboard.service if present from a previous install
if systemctl is-enabled fix-keyboard.service 2>/dev/null; then
    systemctl disable --now fix-keyboard.service
    rm -f /etc/systemd/system/fix-keyboard.service
    systemctl daemon-reload
fi

echo "Done."
