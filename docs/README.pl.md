# Copilot Key Oracle

> 🌐 Polski | [🇬🇧 English](../README.md) | [🇩🇪 Deutsch](./README.de.md) | [🇪🇸 Español](./README.es.md) | [🇫🇷 Français](./README.fr.md) | [🇵🇹 Português](./README.pt.md) | [📚 Translations](../TRANSLATIONS.md)

Zamień klawisz Copilot z Dell w launcher dowolnej aplikacji, URL lub polecenia w Linux.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)
[![Downloads](https://img.shields.io/github/downloads/fabiangold/copilot-key-oracle/total)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Instalacja

### Z Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Z pobranych plikow

```bash
chmod +x install.sh
sudo ./install.sh
```

## Jak to działa

```text
Klawisz Copilot -> keyd -> launcher uzytkownika -> twoja aplikacja
```

![Diagram przeplywu](./assets/flow.svg)

## Dzialajaca kombinacja

Klawisz Copilot zwrocil:

```text
leftshift + leftmeta + f23
```

Aktualny cel:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Konfiguracja celu

Przekaz inny komend przy instalacji:

```bash
sudo ./install.sh 'twoja-komenda'
```

Przyklady:

```bash
sudo ./install.sh 'flatpak run org.gnome.gedit'
sudo ./install.sh 'xdg-open https://claude.ai'
sudo ./install.sh '/usr/bin/firefox --new-window https://example.com'
```

## Logi

- Log instalacji: `/tmp/copilot-key-oracle-install.log`
- Log launchera: `/tmp/copilot-key-oracle-launch.log`

## Rozwiazywanie problemow

- Jesli zamiast aplikacji otwieraja sie Ustawienia, wyczysc konflikty GNOME w `gsettings` i zrestartuj `keyd`.
- Jesli nic sie nie dzieje, sprawdz kombinacje przez `sudo keyd monitor`.
- Jesli aplikacja otwiera sie tylko wtedy, gdy terminal jest otwarty, launcher nie korzysta poprawnie z sesji uzytkownika.
- Potrzebujesz pomocy? Zapytaj na Discordzie: [fg-dev](https://discord.gg/fg-dev)

## Deinstalacja

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Releases

- Pakiet Debian: pobierz `.deb` z [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Archiwum zrodlowe: pobierz `.tar.gz` z [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Instalacja ze zrodel: uzyj `install.sh`
- Lokalne budowanie: `bash packaging/deb/build.sh`
- Uwaga: to repo udostepnia pakiety przez GitHub Releases, a nie przez zakladke GitHub Packages.
