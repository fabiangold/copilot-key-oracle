#!/usr/bin/env bash
set -euo pipefail

TARGET_USER="${SUDO_USER:-${USER:-fabiandev}}"
TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6)"
TARGET_COMMAND="${TARGET_COMMAND:-/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja}"
COMBO="${COPILOT_COMBO:-leftshift+leftmeta+f23}"
KEYD_CONF="/etc/keyd/default.conf"
LAUNCHER="/usr/local/bin/copilot-app-launcher"
LOG="/tmp/copilot-key-oracle-install.log"

log() { printf '[%s] %s\n' "$(date '+%F %T')" "$*" | tee -a "$LOG"; }
run() { log "RUN: $*"; "$@"; }

if [[ $# -gt 0 ]]; then
  TARGET_COMMAND="$*"
fi

log "Installing for user: $TARGET_USER"

if ! command -v keyd >/dev/null 2>&1; then
  log "keyd not found, installing build deps"
  run sudo apt update
  run sudo apt install -y git make gcc
  tmpdir="$(mktemp -d)"
  run git clone https://github.com/rvaiya/keyd "$tmpdir/keyd"
  run make -C "$tmpdir/keyd"
  run sudo make -C "$tmpdir/keyd" install
fi

log "Writing launcher: $LAUNCHER"
cat > "$TARGET_HOME/.copilot-app-launcher.tmp" <<EOF
#!/usr/bin/env bash
set -u

USER_NAME="$TARGET_USER"
USER_ID="$(id -u "$TARGET_USER")"
TARGET_COMMAND="$TARGET_COMMAND"
LOG_FILE="/tmp/copilot-key-oracle-launch.log"

log() { printf '[%s] %s\n' "\$(date '+%F %T')" "\$1" >>"\$LOG_FILE"; }

run_as_user() {
  runuser -u "\$USER_NAME" -- env \
    HOME="/home/\$USER_NAME" \
    USER="\$USER_NAME" \
    LOGNAME="\$USER_NAME" \
    XDG_RUNTIME_DIR="/run/user/\$USER_ID" \
    DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/\$USER_ID/bus" \
    DISPLAY=":0" \
    WAYLAND_DISPLAY="wayland-0" \
    "\$@"
}

log "triggered"

if run_as_user systemd-run --user --collect --quiet --property=Type=exec -- sh -lc "\$TARGET_COMMAND" >/dev/null 2>&1; then
  log "launched via systemd-run"
  exit 0
fi

if run_as_user sh -lc "nohup \$TARGET_COMMAND >/dev/null 2>&1 </dev/null &" >/dev/null 2>&1; then
  log "launched via nohup fallback"
  exit 0
fi

log "launch failed"
exit 1
EOF
run sudo install -m 755 "$TARGET_HOME/.copilot-app-launcher.tmp" "$LAUNCHER"
run rm -f "$TARGET_HOME/.copilot-app-launcher.tmp"

log "Writing keyd config: $KEYD_CONF"
cat > "$TARGET_HOME/.keyd-default.tmp" <<EOF
[ids]
*

[main]
$COMBO = command($LAUNCHER)
EOF
run sudo install -m 644 "$TARGET_HOME/.keyd-default.tmp" "$KEYD_CONF"
run rm -f "$TARGET_HOME/.keyd-default.tmp"

log "Enabling keyd"
run sudo systemctl enable --now keyd
run sudo systemctl restart keyd

log "Cleaning conflicts in GNOME shortcuts"
run gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['']"
run gsettings set org.gnome.settings-daemon.plugins.media-keys control-center-static "['']"
run gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[]"

log "Done"
log "Test with: sudo keyd monitor"
