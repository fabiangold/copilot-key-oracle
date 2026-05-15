# Copilot Key Oracle

> 🌐 Deutsch | [🇬🇧 English](../README.md) | [🇪🇸 Español](./README.es.md) | [🇫🇷 Français](./README.fr.md) | [🇵🇹 Português](./README.pt.md) | [🇵🇱 Polski](./README.pl.md) | [📚 Übersetzungen](../TRANSLATIONS.md)

Verwandle die Dell-Copilot-Taste unter Linux in einen Launcher für beliebige Apps, URLs oder Befehle.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)
[![Downloads](https://img.shields.io/github/downloads/fabiangold/copilot-key-oracle/total)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Installation

### Aus Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Aus heruntergeladenen Dateien

```bash
chmod +x install.sh
sudo ./install.sh
```

## So funktioniert es

```text
Copilot-Taste -> keyd -> User-Session-Launcher -> deine App
```

![Ablaufdiagramm](./assets/flow.svg)

## Funktionierende Kombination

Die Copilot-Taste lieferte:

```text
leftshift + leftmeta + f23
```

Aktuelles Ziel:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Ziel konfigurieren

Übergib beim Installieren einfach einen anderen Befehl:

```bash
sudo ./install.sh 'dein-befehl-hier'
```

Beispiele:

```bash
sudo ./install.sh 'flatpak run org.gnome.gedit'
sudo ./install.sh 'xdg-open https://claude.ai'
sudo ./install.sh '/usr/bin/firefox --new-window https://example.com'
```

## Logs

- Install-Log: `/tmp/copilot-key-oracle-install.log`
- Launcher-Log: `/tmp/copilot-key-oracle-launch.log`

## Troubleshooting

- Wenn statt der App die Einstellungen aufgehen, GNOME-Konflikte in `gsettings` leeren und `keyd` neu starten.
- Wenn nichts passiert, die Kombination mit `sudo keyd monitor` prüfen.
- Wenn die App nur mit offenem Terminal startet, wird die User-Session nicht korrekt verwendet.
- Brauchst du Hilfe? Frag im Discord: [fg-dev](https://discord.gg/fg-dev)

## Deinstallation

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Releases

- Debian-Paket: lade die `.deb`-Datei aus den [Releases](https://github.com/fabiangold/copilot-key-oracle/releases) herunter
- Source-Archiv: lade das `.tar.gz` aus den [Releases](https://github.com/fabiangold/copilot-key-oracle/releases) herunter
- Source-Install: nutze `install.sh`
- Lokal bauen: `bash packaging/deb/build.sh`
- Hinweis: Dieses Repo verteilt Pakete über GitHub Releases, nicht über den GitHub-Packages-Tab.
