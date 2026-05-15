# Copilot Key Oracle

> [Deutsch](./README.de.md) | English

Turn the Dell Copilot key into a launcher for any app, URL, or command on Linux.

## Why this repo exists

This machine-specific setup documents the exact path that worked on a Dell XPS under Zorin/GNOME.
It captures the research, the working combo, and the scripts needed so the next person does not have to repeat the trial-and-error.

## What it does

- Uses `keyd` to intercept the Copilot combo.
- Launches the target in the user session, not as root.
- Includes logs, install, uninstall, and a future-proof customization path.

## Working combo on this machine

The Copilot key produced:

```text
leftshift + leftmeta + f23
```

Current target:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Quick start

### Install from Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Install from downloaded files

```bash
chmod +x install.sh
sudo ./install.sh
```

## Change the target app

Pass a different command at install time:

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

## Troubleshooting

- If Settings opens instead of your app, clear GNOME conflicts in `gsettings` and restart `keyd`.
- If nothing happens, verify the combo with `sudo keyd monitor`.
- If the app only opens while a terminal is open, the launcher is not using the user session correctly.

## Files

- `install.sh` - installs and wires up the mapping
- `uninstall.sh` - removes the mapping and launcher
- `keyd-default.conf.example` - reference config
- `README.de.md` - German guide
- `README.md` - this guide
