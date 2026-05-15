# Copilot Key Oracle

> Polski | [English](./README.md) | [Deutsch](./README.de.md) | [Español](./README.es.md) | [Français](./README.fr.md) | [Português](./README.pt.md)

Zamien klawisz Copilot z Dell w uruchamiacz dowolnej aplikacji, URL lub polecenia w Linux.

## TL;DR

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Wersje jezykowe

- English: `README.md`
- Deutsch: `README.de.md`
- Español: `README.es.md`
- Français: `README.fr.md`
- Português: `README.pt.md`
- Polski: ten plik

## Dlaczego to repo istnieje

Ta konfiguracja dokumentuje dokladna droge, ktora zadzialala na Dell XPS z Zorin/GNOME.
Zawiera badania, dzialajacy skrót i skrypty, zeby nikt nie musial przechodzic przez ten sam proces.

## Co robi

- Uzywa `keyd`, aby przechwycic kombinacje Copilot.
- Uruchamia cel w sesji uzytkownika, nie jako root.
- Zawiera logi, instalacje, deinstalacje i mozliwosc latwej zmiany celu.

## Wykryta kombinacja

```text
leftshift + leftmeta + f23
```

## Instalacja z Git

```bash
git clone https://github.com/fabiangold/copilot-key-oracle.git
cd copilot-key-oracle
chmod +x install.sh
sudo ./install.sh
```

## Zmiana docelowej aplikacji

```bash
sudo ./install.sh 'xdg-open https://claude.ai'
```

## Logi

- Instalacja: `/tmp/copilot-key-oracle-install.log`
- Launcher: `/tmp/copilot-key-oracle-launch.log`

## Test

```bash
systemctl is-active keyd
sudo keyd monitor
```
