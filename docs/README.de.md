# Copilot Key Oracle

> Deutsch | [English](../README.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Português](./README.pt.md) | [Polski](./README.pl.md)

⚡ Verwandle die Dell-Copilot-Taste unter Linux in einen Startknopf fuer beliebige Apps, URLs oder Befehle.

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Community

💬 Discord: [fg-dev](https://discord.gg/fg-dev)

## Sprachversionen

- English: `README.md`
- Deutsch: diese Datei
- Spanisch: `docs/README.es.md`
- Franzoesisch: `docs/README.fr.md`
- Portugiesisch: `docs/README.pt.md`
- Polnisch: `docs/README.pl.md`

## Warum dieses Repo existiert

Diese machine-spezifische Loesung dokumentiert den exakten Weg, der auf einem Dell XPS unter Zorin/GNOME funktioniert hat.
Sie enthaelt die Recherche, die funktionierende Tastenkombination und die Skripte, damit die naechste Person nicht mehr alles neu herausfinden muss.

## Was es macht

- 🔑 Nutzt `keyd`, um die Copilot-Kombination abzufangen.
- 🚀 Startet das Ziel im User-Session-Kontext, nicht als root.
- 🧰 Bringt Logs, Install, Uninstall und einen klaren Anpassungsweg mit.
