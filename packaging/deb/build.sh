#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
VERSION="1.0.0"
PKG_NAME="copilot-key-oracle"
ARCH="all"
STAGE="${ROOT}/dist/${PKG_NAME}_${VERSION}_${ARCH}"
OUT="${ROOT}/dist/${PKG_NAME}_${VERSION}_${ARCH}.deb"

rm -rf "${ROOT}/dist"
mkdir -p "${STAGE}/opt/copilot-key-oracle" \
         "${STAGE}/usr/local/bin" \
         "${STAGE}/DEBIAN"

copy_paths=(README.md LICENSE install.sh uninstall.sh scripts examples docs)
for p in "${copy_paths[@]}"; do
  cp -R "${ROOT}/${p}" "${STAGE}/opt/copilot-key-oracle/"
done

cat > "${STAGE}/usr/local/bin/copilot-key-oracle-install" <<'EOF'
#!/usr/bin/env bash
exec /opt/copilot-key-oracle/install.sh "$@"
EOF

cat > "${STAGE}/usr/local/bin/copilot-key-oracle-uninstall" <<'EOF'
#!/usr/bin/env bash
exec /opt/copilot-key-oracle/uninstall.sh "$@"
EOF

chmod +x "${STAGE}/usr/local/bin/copilot-key-oracle-install" "${STAGE}/usr/local/bin/copilot-key-oracle-uninstall"

cat > "${STAGE}/DEBIAN/control" <<EOF
Package: ${PKG_NAME}
Version: ${VERSION}
Section: utils
Priority: optional
Architecture: ${ARCH}
Maintainer: Fabian Gold <fabiandev@users.noreply.github.com>
Depends: bash, coreutils, util-linux, gsettings-desktop-schemas
Description: Keyd-based launcher for the Dell Copilot key
 A small, documented Linux setup for mapping the Dell Copilot key to any app,
 URL, or shell command.
EOF

cat > "${STAGE}/DEBIAN/postinst" <<'EOF'
#!/usr/bin/env bash
set -e
chmod +x /opt/copilot-key-oracle/install.sh /opt/copilot-key-oracle/uninstall.sh /opt/copilot-key-oracle/scripts/install.sh /opt/copilot-key-oracle/scripts/uninstall.sh
echo "Copilot Key Oracle installed. Run: sudo /opt/copilot-key-oracle/install.sh"
EOF
chmod +x "${STAGE}/DEBIAN/postinst"

dpkg-deb --build "${STAGE}" "${OUT}"
echo "Built: ${OUT}"
