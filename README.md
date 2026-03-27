# ideapad-keyboard-suspend-fix

These scripts fix two bugs on the Lenovo IdeaPad Slim 3 15ABR8 under Linux. The keyboard becomes unresponsive after waking from suspend, and the lid switch sometimes completely stops triggering suspend.

Tested on the IdeaPad Slim 3 15ABR8 running Linux Mint. This fix might also work on other IdeaPad models with the same symptoms.

## What it does

Two systemd services get installed. fix-keyboard rebinds the i8042 and atkbd drivers after every suspend, since they fail to reinitialize on wake. lid-watch polls the lid state every second and triggers suspend when the lid is closed, because the ACPI lid switch event stops firing after the first suspend/wake cycle.

## Install

```sh
git clone https://github.com/Refloks/ideapad-keyboard-suspend-fix
cd ideapad-keyboard-suspend-fix
sudo sh install.sh
```

## Uninstall

```sh
sudo systemctl disable --now fix-keyboard.service lid-watch.service
sudo rm /usr/local/bin/fix-keyboard.sh /usr/local/bin/lid-watch.sh
sudo rm /etc/systemd/system/fix-keyboard.service /etc/systemd/system/lid-watch.service
sudo systemctl daemon-reload
```

## Verify it's working

After suspending and waking, run `journalctl -b | grep fix-keyboard` and check that `Finished fix-keyboard.service` appears near the bottom.
