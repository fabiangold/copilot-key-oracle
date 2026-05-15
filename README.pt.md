# Copilot Key Oracle

> Português | [English](./README.md) | [Deutsch](./README.de.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Polski](./README.pl.md)

⚡ Transforme a tecla Copilot da Dell em um launcher para qualquer app, URL ou comando no Linux.

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Comunidade

💬 Discord: [fg-dev](https://discord.gg/fg-dev)

## Versoes de idioma

- English: `README.md`
- Deutsch: `README.de.md`
- Español: `README.es.md`
- Français: `README.fr.md`
- Português: este arquivo
- Polski: `README.pl.md`

## Por que este repo existe

Esta configuracao documenta o caminho exato que funcionou em um Dell XPS com Zorin/GNOME.
Ela guarda a pesquisa, a combinacao que funcionou e os scripts para nao repetir o trabalho.

## O que faz

- 🔑 Usa `keyd` para interceptar a combinacao Copilot.
- 🚀 Abre o alvo na sessao do usuario, nao como root.
- 🧰 Inclui logs, instalacao, desinstalacao e caminho de personalizacao.

## Combinacao detectada

```text
leftshift + leftmeta + f23
```

## Instalar via Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Trocar o app alvo

```bash
sudo ./install.sh 'xdg-open https://claude.ai'
```

## Logs

- Instalacao: `/tmp/copilot-key-oracle-install.log`
- Launcher: `/tmp/copilot-key-oracle-launch.log`

## Testar

```bash
systemctl is-active keyd
sudo keyd monitor
```
