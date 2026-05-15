# Copilot Key Oracle

> Português | [English](../README.md) | [Deutsch](./README.de.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Polski](./README.pl.md) | [Translations](../TRANSLATIONS.md)

⚡ Transforme a tecla Copilot da Dell em um launcher para qualquer app, URL ou comando no Linux.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Previa

```text
Tecla Copilot -> keyd -> launcher do usuario -> seu app
```

![Diagrama de fluxo](./assets/flow.svg)

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Comunidade

💬 Discord: [fg-dev](https://discord.gg/fg-dev)

## Pacotes

- Pacote Debian: baixe o `.deb` em [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Arquivo fonte: baixe o `.tar.gz` em [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Instalação a partir do código: use `install.sh`

> Observação: este repo distribui pacotes via GitHub Releases, não pela aba GitHub Packages.

## Construir a partir do pacote fonte

```bash
bash packaging/deb/build.sh
```

## Layout

- `install.sh` - wrapper para o instalador real
- `uninstall.sh` - wrapper para o desinstalador real
- `scripts/` - scripts de implementação
- `examples/` - arquivos de exemplo de configuração
- `packaging/` - ajuda para gerar pacotes
- `docs/` - todas as traduções
- `LICENSE` - licença do projeto

## Versoes de idioma

- English: `../README.md`
- Deutsch: `README.de.md`
- Español: `README.es.md`
- Français: `README.fr.md`
- Português: este arquivo
- Polski: `README.pl.md`

## Por que este repo existe

Esta configuracao especifica da maquina documenta o caminho exato que funcionou em um Dell XPS com Zorin/GNOME.
Ela reúne a pesquisa, a combinacao que funcionou e os scripts para que a proxima pessoa nao precise repetir os testes.

## O que faz

- 🔑 Usa `keyd` para interceptar a combinacao Copilot.
- 🚀 Abre o alvo na sessao do usuario, nao como root.
- 🧰 Inclui logs, instalacao, desinstalacao e um caminho de personalizacao pronto para o futuro.

## Combinacao que funciona nesta maquina

A tecla Copilot produziu:

```text
leftshift + leftmeta + f23
```

Alvo atual:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Inicio rapido

### Instalar via Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Instalar a partir de arquivos baixados

```bash
chmod +x install.sh
sudo ./install.sh
```

## Trocar o app alvo

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

## Verificar

```bash
systemctl is-active keyd
sudo keyd monitor
```

## Desinstalar

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Solucao de problemas

- Se abrir Configuracoes em vez do app, limpe conflitos do GNOME em `gsettings` e reinicie o `keyd`.
- Se nada acontecer, verifique a combinacao com `sudo keyd monitor`.
- Se o app so abrir com o terminal aberto, o launcher nao esta usando corretamente a sessao do usuario.

## Arquivos

- `install.sh` - ponto de entrada do instalador
- `uninstall.sh` - ponto de entrada do desinstalador
- `scripts/install.sh` - instala e conecta o mapeamento
- `scripts/uninstall.sh` - remove o mapeamento e o launcher
- `packaging/deb/build.sh` - gera o pacote Debian
- `examples/keyd-default.conf.example` - configuracao de referencia
- `README.md` - pagina principal em ingles
