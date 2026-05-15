#!/usr/bin/env bash
set -euo pipefail

sudo rm -f /etc/keyd/default.conf
sudo rm -f /usr/local/bin/copilot-app-launcher
sudo systemctl restart keyd || true

gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['XF86Tools']" || true
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center-static "['XF86Tools']" || true

echo "Removed Copilot mapping."
