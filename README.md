# Copilot Key Oracle

Map the Dell Copilot key on Linux to any app, URL, or launcher.

## What this does

- Uses `keyd` to intercept the Copilot combo observed on Dell XPS systems.
- Launches the target app in the user session, not the root terminal.
- Includes logging and a rollback path.

## Current proven mapping

On this machine, the Copilot key produced:

```text
leftshift + leftmeta + f23
```

Current launcher target:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Install

```bash
chmod +x install.sh
sudo ./install.sh
```

## Change target app

Edit `install.sh` and change `TARGET_COMMAND`, or run:

```bash
sudo ./install.sh 'your-command-here'
```

Examples:

```bash
sudo ./install.sh 'flatpak run org.gnome.gedit'
sudo ./install.sh 'xdg-open https://claude.ai'
sudo ./install.sh '/usr/bin/firefox --new-window https://example.com'
```

## Logs

- Install log: `/tmp/copilot-key-oracle-install.log`
- Launcher log: `/tmp/copilot-key-oracle-launch.log`

## Verify

```bash
systemctl is-active keyd
sudo keyd monitor
```

## Uninstall

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Notes

- If Settings opens instead of your app, clear GNOME conflicts in `gsettings` and restart `keyd`.
- If the key does nothing, verify the combo with `sudo keyd monitor`.
