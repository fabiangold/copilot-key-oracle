# Copilot Key Oracle

> Français | [English](./README.md) | [Deutsch](./README.de.md) | [Español](./README.es.md) | [Português](./README.pt.md) | [Polski](./README.pl.md)

Transforme la touche Copilot Dell en lanceur pour n'importe quelle application, URL ou commande sous Linux.

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Versions linguistiques

- English: `README.md`
- Deutsch: `README.de.md`
- Español: `README.es.md`
- Français: ce fichier
- Português: `README.pt.md`
- Polski: `README.pl.md`

## Pourquoi ce repo existe

Cette configuration documente le chemin exact qui a fonctionné sur un Dell XPS avec Zorin/GNOME.
Elle regroupe la recherche, la combinaison gagnante et les scripts nécessaires pour éviter de tout refaire.

## Ce que cela fait

- Utilise `keyd` pour intercepter la combinaison Copilot.
- Lance la cible dans la session utilisateur, pas en root.
- Inclut les logs, l'installation, la désinstallation et une voie de personnalisation.

## Combinaison détectée

```text
leftshift + leftmeta + f23
```

## Installation depuis Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Changer l'application cible

```bash
sudo ./install.sh 'xdg-open https://claude.ai'
```

## Logs

- Installation: `/tmp/copilot-key-oracle-install.log`
- Lanceur: `/tmp/copilot-key-oracle-launch.log`

## Tester

```bash
systemctl is-active keyd
sudo keyd monitor
```
