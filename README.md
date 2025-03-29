# ZeroTier One - Docker Compose

Prosty sposób na uruchomienie klienta ZeroTier w kontenerze Docker z automatyczną konfiguracją i połączeniem z wybraną siecią/sieciami ZeroTier.

---

## 🚀 Szybki start

### 1. Pobierz skrypt instalacyjny

```bash
wget https://raw.githubusercontent.com/komputeros/zerotier-one-docker-compose/main/clone_and_configure_zerotier.sh
chmod +x clone_and_configure_zerotier.sh
```

### 2. Uruchom skrypt

```bash
./clone_and_configure_zerotier.sh
```

Skrypt:

- klonuje repozytorium do katalogu `zerotier-config`,
- tworzy plik `.env` z numerami sieci ZeroTier (zdefiniowanymi w skrypcie),
- przygotowuje katalog `config/` do mapowania jako volume,
- domyślnie uruchamia kontener Docker przy użyciu `docker compose up -d`.

---

## ⚙️ Opcje skryptu

### Uruchomienie z automatycznym startem kontenera (domyślnie)

```bash
./clone_and_configure_zerotier.sh
```

### Tylko pobranie repozytorium (bez uruchamiania kontenera)

```bash
./clone_and_configure_zerotier.sh --only-clone
```

---

## 🐳 Uruchomienie kontenera ręcznie

Jeśli użyłeś `--only-clone`, przejdź do katalogu i uruchom kontener ręcznie:

```bash
cd zerotier-config
docker compose up -d
```

---

## 🔍 Sprawdzenie statusu klienta ZeroTier

Aby sprawdzić status działania klienta ZeroTier w kontenerze:

```bash
docker exec zerotier-one zerotier-cli info
```

Przykładowy wynik:

```
200 info <node-id> ONLINE <version>
```

---

## 📁 Struktura katalogów

```
zerotier-config/
├── clone_and_configure_zerotier.sh
├── docker-compose.yml
├── .env
└── config/              # <- katalog montowany do kontenera
```

> Zawartość `config/` jest ignorowana w repozytorium – tylko struktura katalogu jest zachowana (`.gitkeep`).

---

## ✅ Wymagania

- Docker
- Docker Compose (v2)
- System wspierający `/dev/net/tun` (np. Linux)
- Klucz SSH skonfigurowany do dostępu do GitHub (jeśli używasz SSH)

---

## 📄 Licencja

Projekt dostępny na licencji MIT.
