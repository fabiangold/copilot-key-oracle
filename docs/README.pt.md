# Copilot Key Oracle

> 🌐 Português | [🇬🇧 English](../README.md) | [🇩🇪 Deutsch](./README.de.md) | [🇪🇸 Español](./README.es.md) | [🇫🇷 Français](./README.fr.md) | [🇵🇱 Polski](./README.pl.md) | [📚 Translations](../TRANSLATIONS.md)

Transforme a tecla Copilot da Dell em um launcher para qualquer app, URL ou comando no Linux.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)
[![Downloads](https://img.shields.io/github/downloads/fabiangold/copilot-key-oracle/total)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Instalação

### Via Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Via arquivos baixados

```bash
chmod +x install.sh
sudo ./install.sh
```

## Como funciona

```text
Tecla Copilot -> keyd -> launcher do usuario -> seu app
```

![Diagrama de fluxo](./assets/flow.svg)

## Combinação que funciona

A tecla Copilot produziu:

```text
leftshift + leftmeta + f23
```

Alvo atual:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Configurar o alvo

Passe um comando diferente na instalacao:

```bash
sudo ./install.sh 'seu-comando-aqui'
```

Exemplos:

```bash
sudo ./install.sh 'flatpak run org.gnome.gedit'
sudo ./install.sh 'xdg-open https://claude.ai'
sudo ./install.sh '/usr/bin/firefox --new-window https://example.com'
```

## Logs

- Log de instalacao: `/tmp/copilot-key-oracle-install.log`
- Log do launcher: `/tmp/copilot-key-oracle-launch.log`

## Solucao de problemas

- Se abrir Configuracoes em vez do app, limpe conflitos do GNOME em `gsettings` e reinicie o `keyd`.
- Se nada acontecer, verifique a combinacao com `sudo keyd monitor`.
- Se o app so abrir com o terminal aberto, o launcher nao esta usando corretamente a sessao do usuario.
- Precisa de ajuda? Pergunte no Discord: [fg-dev](https://discord.gg/fg-dev)

## Desinstalar

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Releases

- Pacote Debian: baixe o `.deb` em [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Arquivo fonte: baixe o `.tar.gz` em [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Instalação a partir do código: use `install.sh`
- Build local: `bash packaging/deb/build.sh`
- Observação: este repo distribui pacotes via GitHub Releases, não pela aba GitHub Packages.
