# Copilot Key Oracle

> Español | [English](../README.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Português](./README.pt.md) | [Polski](./README.pl.md) | [Translations](../TRANSLATIONS.md)

⚡ Convierte la tecla Copilot de Dell en un lanzador para cualquier app, URL o comando en Linux.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Vista previa

```text
Tecla Copilot -> keyd -> lanzador de usuario -> tu app
```

![Diagrama de flujo](./assets/flow.svg)

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Comunidad

💬 Discord: [fg-dev](https://discord.gg/fg-dev)

## Paquetes

- Paquete Debian: descarga el `.deb` desde los [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Archivo fuente: descarga el `.tar.gz` desde los [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Instalación desde código: usa `install.sh`

> Nota: este repo distribuye paquetes mediante GitHub Releases, no mediante la pestaña GitHub Packages.

## Construir desde el paquete fuente

```bash
bash packaging/deb/build.sh
```

## Layout

- `install.sh` - wrapper para el instalador real
- `uninstall.sh` - wrapper para el desinstalador real
- `scripts/` - scripts de implementación
- `examples/` - archivos de configuración de ejemplo
- `packaging/` - ayuda para construir paquetes
- `docs/` - todas las traducciones
- `LICENSE` - licencia del proyecto

## Versiones de idioma

- English: `../README.md`
- Deutsch: `README.de.md`
- Español: este archivo
- Français: `README.fr.md`
- Português: `README.pt.md`
- Polski: `README.pl.md`

## Por qué existe este repo

Esta configuración específica de la máquina documenta el camino exacto que funcionó en un Dell XPS con Zorin/GNOME.
Reúne la investigación, la combinación que funciona y los scripts para que la siguiente persona no tenga que repetir todo el ensayo y error.

## Qué hace

- 🔑 Usa `keyd` para interceptar la combinación Copilot.
- 🚀 Lanza el objetivo en la sesión del usuario, no como root.
- 🧰 Incluye logs, instalación, desinstalación y una vía de personalización preparada para el futuro.

## Combinación que funciona en esta máquina

La tecla Copilot produjo:

```text
leftshift + leftmeta + f23
```

Objetivo actual:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Inicio rápido

### Instalar desde Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Instalar desde archivos descargados

```bash
chmod +x install.sh
sudo ./install.sh
```

## Cambiar la app objetivo

Pasa un comando distinto al instalar:

```bash
sudo ./install.sh 'tu-comando-aqui'
```

Ejemplos:

```bash
sudo ./install.sh 'flatpak run org.gnome.gedit'
sudo ./install.sh 'xdg-open https://claude.ai'
sudo ./install.sh '/usr/bin/firefox --new-window https://example.com'
```

## Logs

- Log de instalación: `/tmp/copilot-key-oracle-install.log`
- Log del launcher: `/tmp/copilot-key-oracle-launch.log`

## Verificar

```bash
systemctl is-active keyd
sudo keyd monitor
```

## Desinstalar

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Solución de problemas

- Si se abre Configuración en lugar de tu app, limpia conflictos de GNOME en `gsettings` y reinicia `keyd`.
- Si no pasa nada, verifica la combinación con `sudo keyd monitor`.
- Si la app solo abre con el terminal abierto, el launcher no está usando correctamente la sesión de usuario.

## Archivos

- `install.sh` - punto de entrada para el instalador
- `uninstall.sh` - punto de entrada para el desinstalador
- `scripts/install.sh` - instala y conecta el mapeo
- `scripts/uninstall.sh` - elimina el mapeo y el launcher
- `packaging/deb/build.sh` - construye el paquete Debian
- `examples/keyd-default.conf.example` - configuración de referencia
- `README.md` - página principal en inglés
