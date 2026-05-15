# Copilot Key Oracle

> Español | [English](./README.md) | [Deutsch](./README.de.md) | [Français](./README.fr.md) | [Português](./README.pt.md) | [Polski](./README.pl.md)

⚡ Convierte la tecla Copilot de Dell en un lanzador para cualquier app, URL o comando en Linux.

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Comunidad

💬 Discord: [fg-dev](https://discord.gg/fg-dev)

## Versión de idioma

- English: `README.md`
- Deutsch: `README.de.md`
- Español: este archivo
- Français: `README.fr.md`
- Português: `README.pt.md`
- Polski: `README.pl.md`

## Por qué existe

Esta configuración documenta el camino exacto que funcionó en un Dell XPS con Zorin/GNOME.
Incluye la investigación, la combinación que funciona y los scripts necesarios para no repetir el proceso.

## Qué hace

- 🔑 Usa `keyd` para interceptar la combinación Copilot.
- 🚀 Lanza la app en la sesión del usuario, no como root.
- 🧰 Incluye logs, instalación, desinstalación y una ruta de personalización.

## Combinación detectada

```text
leftshift + leftmeta + f23
```

## Instalar desde Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Cambiar la app objetivo

```bash
sudo ./install.sh 'xdg-open https://claude.ai'
```

## Logs

- Instalación: `/tmp/copilot-key-oracle-install.log`
- Lanzador: `/tmp/copilot-key-oracle-launch.log`

## Probar

```bash
systemctl is-active keyd
sudo keyd monitor
```
