# ideapad-keyboard-suspend-fix

These scripts fix two bugs on the Lenovo IdeaPad Slim 3 15ABR8 under Linux. The keyboard becomes unresponsive after waking from suspend, and the lid switch sometimes completely stops triggering suspend.

Tested on the IdeaPad Slim 3 15ABR8 running Linux Mint. This fix might also work on other IdeaPad models with the same symptoms.

## What it does

A systemd-sleep hook and a systemd service get installed. fix-keyboard rebinds the i8042 and atkbd drivers after every resume, since they fail to reinitialize on wake. lid-watch polls the lid state every second and triggers suspend when the lid is closed, because the ACPI lid switch event stops firing after the first suspend/wake cycle.

## Install
```sh
git clone https://github.com/Refloks/ideapad-keyboard-suspend-fix
cd ideapad-keyboard-suspend-fix
sudo sh install.sh
```

## Uninstall
```sh
sudo rm /usr/lib/systemd/system-sleep/fix-keyboard
sudo systemctl disable --now lid-watch.service
sudo rm /usr/local/bin/lid-watch.sh /etc/systemd/system/lid-watch.service
sudo systemctl daemon-reload
```

## Verify it's working

After suspending and waking, run `journalctl -b | grep fix-keyboard` and check that the hook ran with a `post` argument near the resume timestamp.
