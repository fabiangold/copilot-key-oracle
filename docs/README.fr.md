# Copilot Key Oracle

> 🌐 Français | [🇬🇧 English](../README.md) | [🇩🇪 Deutsch](./README.de.md) | [🇪🇸 Español](./README.es.md) | [🇵🇹 Português](./README.pt.md) | [🇵🇱 Polski](./README.pl.md) | [📚 Translations](../TRANSLATIONS.md)

Transforme la touche Copilot Dell en lanceur pour n'importe quelle application, URL ou commande sous Linux.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)
[![Downloads](https://img.shields.io/github/downloads/fabiangold/copilot-key-oracle/total)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Installation

### Depuis Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Depuis des fichiers téléchargés

```bash
chmod +x install.sh
sudo ./install.sh
```

## Fonctionnement

```text
Touche Copilot -> keyd -> lanceur utilisateur -> votre app
```

![Diagramme de flux](./assets/flow.svg)

## Combinaison qui fonctionne

La touche Copilot a produit :

```text
leftshift + leftmeta + f23
```

Cible actuelle :

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Configurer la cible

Passe une commande différente à l'installation :

```bash
sudo ./install.sh 'ta-commande-ici'
```

Exemples :

```bash
sudo ./install.sh 'flatpak run org.gnome.gedit'
sudo ./install.sh 'xdg-open https://claude.ai'
sudo ./install.sh '/usr/bin/firefox --new-window https://example.com'
```

## Journaux

- Journal d'installation : `/tmp/copilot-key-oracle-install.log`
- Journal du lanceur : `/tmp/copilot-key-oracle-launch.log`

## Dépannage

- Si les Paramètres s'ouvrent à la place de ton app, supprime les conflits GNOME dans `gsettings` et redémarre `keyd`.
- Si rien ne se passe, vérifie la combinaison avec `sudo keyd monitor`.
- Si l'app ne s'ouvre que lorsque le terminal est ouvert, le lanceur n'utilise pas correctement la session utilisateur.
- Besoin d'aide ? Demande sur Discord : [fg-dev](https://discord.gg/fg-dev)

## Désinstallation

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Releases

- Paquet Debian : télécharge le `.deb` depuis les [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Archive source : télécharge le `.tar.gz` depuis les [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Installation depuis le code source : utilise `install.sh`
- Construction locale : `bash packaging/deb/build.sh`
- Note : ce repo distribue les paquets via GitHub Releases, pas via l’onglet GitHub Packages.
