# Copilot Key Oracle

> 🌐 Español | [🇬🇧 English](../README.md) | [🇩🇪 Deutsch](./README.de.md) | [🇫🇷 Français](./README.fr.md) | [🇵🇹 Português](./README.pt.md) | [🇵🇱 Polski](./README.pl.md) | [📚 Translations](../TRANSLATIONS.md)

Convierte la tecla Copilot de Dell en un lanzador para cualquier app, URL o comando en Linux.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)
[![Downloads](https://img.shields.io/github/downloads/fabiangold/copilot-key-oracle/total)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Instalación

### Desde Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Desde archivos descargados

```bash
chmod +x install.sh
sudo ./install.sh
```

## Cómo funciona

```text
Tecla Copilot -> keyd -> lanzador de usuario -> tu app
```

![Diagrama de flujo](./assets/flow.svg)

## Combinación que funciona

La tecla Copilot produjo:

```text
leftshift + leftmeta + f23
```

Objetivo actual:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Configurar objetivo

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

## Solución de problemas

- Si se abre Configuración en lugar de tu app, limpia conflictos de GNOME en `gsettings` y reinicia `keyd`.
- Si no pasa nada, verifica la combinación con `sudo keyd monitor`.
- Si la app solo abre con el terminal abierto, el launcher no está usando correctamente la sesión de usuario.
- ¿Necesitas ayuda? Pregunta en Discord: [fg-dev](https://discord.gg/fg-dev)

## Desinstalar

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Releases

- Paquete Debian: descarga el `.deb` desde los [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Archivo fuente: descarga el `.tar.gz` desde los [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Instalación desde código: usa `install.sh`
- Compilar localmente: `bash packaging/deb/build.sh`
- Nota: este repo distribuye paquetes mediante GitHub Releases, no mediante la pestaña GitHub Packages.
