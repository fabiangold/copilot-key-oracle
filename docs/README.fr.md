# Copilot Key Oracle

> Français | [English](../README.md) | [Deutsch](./README.de.md) | [Español](./README.es.md) | [Português](./README.pt.md) | [Polski](./README.pl.md) | [Translations](../TRANSLATIONS.md)

⚡ Transforme la touche Copilot Dell en lanceur pour n'importe quelle application, URL ou commande sous Linux.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Aperçu

```text
Touche Copilot -> keyd -> lanceur utilisateur -> votre app
```

![Diagramme de flux](./assets/flow.svg)

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Communauté

💬 Discord : [fg-dev](https://discord.gg/fg-dev)

## Paquets

- Paquet Debian : télécharge le `.deb` depuis les [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Archive source : télécharge le `.tar.gz` depuis les [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Installation depuis le code source : utilise `install.sh`

> Note : ce repo distribue les paquets via GitHub Releases, pas via l’onglet GitHub Packages.

## Construire depuis le paquet source

```bash
bash packaging/deb/build.sh
```

## Layout

- `install.sh` - wrapper pour le vrai installateur
- `uninstall.sh` - wrapper pour le vrai désinstallateur
- `scripts/` - scripts d'implémentation
- `examples/` - fichiers de configuration d'exemple
- `packaging/` - aide à la construction des paquets
- `docs/` - toutes les traductions
- `LICENSE` - licence du projet

## Versions linguistiques

- English: `../README.md`
- Deutsch: `README.de.md`
- Español: `README.es.md`
- Français: ce fichier
- Português: `README.pt.md`
- Polski: `README.pl.md`

## Pourquoi ce repo existe

Cette configuration spécifique à la machine documente le chemin exact qui a fonctionné sur un Dell XPS avec Zorin/GNOME.
Elle rassemble la recherche, la combinaison gagnante et les scripts afin que la prochaine personne n'ait pas à refaire les essais.

## Ce que cela fait

- 🔑 Utilise `keyd` pour intercepter la combinaison Copilot.
- 🚀 Lance la cible dans la session utilisateur, pas en root.
- 🧰 Inclut les logs, l'installation, la désinstallation et une voie de personnalisation prête pour l'avenir.

## Combinaison qui fonctionne sur cette machine

La touche Copilot a produit :

```text
leftshift + leftmeta + f23
```

Cible actuelle :

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Démarrage rapide

### Installer depuis Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Installer depuis des fichiers téléchargés

```bash
chmod +x install.sh
sudo ./install.sh
```

## Changer l'application cible

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

## Logs

- Log d'installation : `/tmp/copilot-key-oracle-install.log`
- Log du lanceur : `/tmp/copilot-key-oracle-launch.log`

## Vérifier

```bash
systemctl is-active keyd
sudo keyd monitor
```

## Désinstaller

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Dépannage

- Si les Paramètres s'ouvrent à la place de ton app, supprime les conflits GNOME dans `gsettings` et redémarre `keyd`.
- Si rien ne se passe, vérifie la combinaison avec `sudo keyd monitor`.
- Si l'app ne s'ouvre que lorsque le terminal est ouvert, le lanceur n'utilise pas correctement la session utilisateur.

## Fichiers

- `install.sh` - point d'entrée pour l'installateur
- `uninstall.sh` - point d'entrée pour le désinstallateur
- `scripts/install.sh` - installe et relie le mapping
- `scripts/uninstall.sh` - supprime le mapping et le lanceur
- `packaging/deb/build.sh` - construit le paquet Debian
- `examples/keyd-default.conf.example` - configuration de référence
- `README.md` - page principale en anglais
