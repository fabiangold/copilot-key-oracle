# Copilot Key Oracle

> Polski | [English](../README.md) | [Deutsch](./README.de.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Português](./README.pt.md) | [Translations](../TRANSLATIONS.md)

⚡ Zamien klawisz Copilot z Dell w uruchamiacz dowolnej aplikacji, URL lub polecenia w Linux.

[![Release](https://img.shields.io/github/v/release/fabiangold/copilot-key-oracle)](https://github.com/fabiangold/copilot-key-oracle/releases)

## Podglad

```text
Klawisz Copilot -> keyd -> launcher uzytkownika -> twoja aplikacja
```

![Diagram przeplywu](./assets/flow.svg)

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Spolecznosc

💬 Discord: [fg-dev](https://discord.gg/fg-dev)

## Pakiety

- Pakiet Debian: pobierz `.deb` z [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Archiwum zrodlowe: pobierz `.tar.gz` z [Releases](https://github.com/fabiangold/copilot-key-oracle/releases)
- Instalacja ze zrodel: uzyj `install.sh`

> Uwaga: to repo udostepnia pakiety przez GitHub Releases, a nie przez zakladke GitHub Packages.

## Budowanie z pakietu zrodlowego

```bash
bash packaging/deb/build.sh
```

## Układ

- `install.sh` - wrapper dla prawdziwego instalatora
- `uninstall.sh` - wrapper dla prawdziwego deinstalatora
- `scripts/` - skrypty implementacji
- `examples/` - przykladowe pliki konfiguracyjne
- `packaging/` - pomoc przy budowie pakietow
- `docs/` - wszystkie tlumaczenia
- `LICENSE` - licencja projektu

## Wersje jezykowe

- English: `../README.md`
- Deutsch: `README.de.md`
- Español: `README.es.md`
- Français: `README.fr.md`
- Português: `README.pt.md`
- Polski: ten plik

## Dlaczego to repo istnieje

Ta konfiguracja specyficzna dla tej maszyny dokumentuje dokladna droge, ktora zadzialala na Dell XPS z Zorin/GNOME.
Zawiera badania, dzialajaca kombinacje i skrypty, zeby kolejna osoba nie musiala tego wszystkiego odtwarzac.

## Co robi

- 🔑 Uzywa `keyd`, aby przechwycic kombinacje Copilot.
- 🚀 Uruchamia cel w sesji uzytkownika, nie jako root.
- 🧰 Zawiera logi, instalacje, deinstalacje i gotowa sciezke personalizacji.

## Dzialajaca kombinacja na tej maszynie

Klawisz Copilot zwrocil:

```text
leftshift + leftmeta + f23
```

Aktualny cel:

```text
/opt/brave.com/brave/brave-browser --profile-directory=Default --app-id=fmpnliohjhemenmnlpbfagaolkdacoja
```

## Szybki start

### Instalacja z Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

### Instalacja z pobranych plikow

```bash
chmod +x install.sh
sudo ./install.sh
```

## Zmiana aplikacji docelowej

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

## Sprawdzenie

```bash
systemctl is-active keyd
sudo keyd monitor
```

## Deinstalacja

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```

## Rozwiazywanie problemow

- Jesli zamiast aplikacji otwieraja sie Ustawienia, wyczysc konflikty GNOME w `gsettings` i zrestartuj `keyd`.
- Jesli nic sie nie dzieje, sprawdz kombinacje przez `sudo keyd monitor`.
- Jesli aplikacja otwiera sie tylko wtedy, gdy terminal jest otwarty, launcher nie korzysta poprawnie z sesji uzytkownika.

## Pliki

- `install.sh` - punkt wejscia do instalatora
- `uninstall.sh` - punkt wejscia do deinstalatora
- `scripts/install.sh` - instaluje i podlacza mapowanie
- `scripts/uninstall.sh` - usuwa mapowanie i launcher
- `packaging/deb/build.sh` - buduje pakiet Debian
- `examples/keyd-default.conf.example` - konfiguracja referencyjna
- `README.md` - glowna strona po angielsku
