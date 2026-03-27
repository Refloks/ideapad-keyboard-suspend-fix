#!/bin/sh
set -e

echo "Installing ideapad-keyboard-suspend-fix..."

cp fix-keyboard.sh /usr/local/bin/fix-keyboard.sh
chmod +x /usr/local/bin/fix-keyboard.sh

cp fix-keyboard.service /etc/systemd/system/fix-keyboard.service

cp lid-watch.sh /usr/local/bin/lid-watch.sh
chmod +x /usr/local/bin/lid-watch.sh

cp lid-watch.service /etc/systemd/system/lid-watch.service

systemctl daemon-reload
systemctl enable --now fix-keyboard.service
systemctl enable --now lid-watch.service

echo "Done. Test by suspending your laptop."
