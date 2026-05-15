# Copilot Key Oracle

> Deutsch | [English](./README.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Português](./README.pt.md) | [Polski](./README.pl.md)

Verwandle die Dell-Copilot-Taste unter Linux in einen Startknopf fuer beliebige Apps, URLs oder Befehle.

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Sprachversionen

- English: `README.md`
- Deutsch: diese Datei
- Spanisch: `README.es.md`
- Franzoesisch: `README.fr.md`
- Portugiesisch: `README.pt.md`
- Polnisch: `README.pl.md`

## Warum dieses Repo existiert

Diese machine-spezifische Loesung dokumentiert den exakten Weg, der auf einem Dell XPS unter Zorin/GNOME funktioniert hat.
Sie enthaelt die Recherche, die funktionierende Tastenkombination und die Skripte, damit die naechste Person nicht mehr alles neu herausfinden muss.

## Was es macht

- Nutzt `keyd`, um die Copilot-Kombination abzufangen.
- Startet das Ziel im User-Session-Kontext, nicht als root.
- Bringt Logs, Install, Uninstall und einen klaren Anpassungsweg mit.

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

## Ziel-App aendern

Uebergib beim Installieren einfach einen anderen Befehl:

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

## Pruefen

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
- Wenn nichts passiert, die Kombination mit `sudo keyd monitor` pruefen.
- Wenn die App nur mit offenem Terminal startet, wird die User-Session nicht korrekt verwendet.

## Dateien

- `install.sh` - installiert und verbindet das Mapping
- `uninstall.sh` - entfernt Mapping und Launcher
- `keyd-default.conf.example` - Referenzkonfiguration
- `README.de.md` - deutsche Anleitung
- `README.md` - englische Anleitung
