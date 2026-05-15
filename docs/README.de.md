# Copilot Key Oracle

> 🌐 Deutsch | [🇬🇧 English](../README.md) | [🇪🇸 Español](./README.es.md) | [🇫🇷 Français](./README.fr.md) | [🇵🇹 Português](./README.pt.md) | [🇵🇱 Polski](./README.pl.md) | [📚 Übersetzungen](../TRANSLATIONS.md)

⚡ Verwandle die Dell-Copilot-Taste unter Linux in einen Startknopf für beliebige Apps, URLs oder Befehle.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)
[![Downloads](https://img.shields.io/github/downloads/fabiangold/copilot-key-oracle/total)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Vorschau

```text
Copilot-Taste -> keyd -> User-Session-Launcher -> deine App
```

![Ablaufdiagramm](./assets/flow.svg)

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Community

💬 Discord: [fg-dev](https://discord.gg/fg-dev)

## Pakete

- Debian-Paket: lade die `.deb`-Datei aus den [Releases](https://github.com/fabiangold/copilot-key-oracle/releases) herunter
- Source-Archiv: lade das `.tar.gz` aus den [Releases](https://github.com/fabiangold/copilot-key-oracle/releases) herunter
- Source-Install: nutze `install.sh`

> Hinweis: Dieses Repo verteilt Pakete über GitHub Releases, nicht über den GitHub-Packages-Tab.

## Build aus Source-Paket

```bash
bash packaging/deb/build.sh
```

## Layout

- `install.sh` - Wrapper für den eigentlichen Installer
- `uninstall.sh` - Wrapper für den eigentlichen Uninstaller
- `scripts/` - Implementierungs-Skripte
- `examples/` - Beispiel-Konfigurationen
- `packaging/` - Helfer für Paket-Builds
- `docs/` - alle Übersetzungen
- `LICENSE` - Projekterlaubnis

## Warum dieses Repo existiert

Diese machine-spezifische Lösung dokumentiert den exakten Weg, der auf einem Dell XPS unter Zorin/GNOME funktioniert hat.
Sie enthält die Recherche, die funktionierende Tastenkombination und die Skripte, damit die nächste Person nicht mehr alles neu herausfinden muss.

## Was es macht

- 🔑 Nutzt `keyd`, um die Copilot-Kombination abzufangen.
- 🚀 Startet das Ziel im User-Session-Kontext, nicht als root.
- 🧰 Bringt Logs, Install, Uninstall und einen klaren Anpassungsweg mit.

## Funktionierende Kombination auf diesem System

Die Copilot-Taste lieferte:

```text
leftshift + leftmeta + f23
```

Aktuelles Ziel:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Schnellstart

### Installation per Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Installation aus heruntergeladenen Dateien

```bash
chmod +x install.sh
sudo ./install.sh
```

## Ziel-App ändern

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

## Prüfen

```bash
systemctl is-active keyd
sudo keyd monitor
```

## Deinstallieren

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Troubleshooting

- Wenn statt der App die Einstellungen aufgehen, GNOME-Konflikte in `gsettings` leeren und `keyd` neu starten.
- Wenn nichts passiert, die Kombination mit `sudo keyd monitor` prüfen.
- Wenn die App nur mit offenem Terminal startet, wird die User-Session nicht korrekt verwendet.
- Brauchst du Hilfe? Frag im Discord: [fg-dev](https://discord.gg/fg-dev)
