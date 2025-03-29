#!/bin/bash

# === KONFIGURACJA ===
REPO_URL="https://github.com/komputeros/zerotier-one-docker-compose.git"
CLONE_DIR="zerotier-config"
NETWORK_IDS="abcdefdeadbeef00 1122334455667788"

# === OBSŁUGA OPCJI ===
ONLY_CLONE=false
if [[ "$1" == "--only-clone" ]]; then
  ONLY_CLONE=true
fi

# === KROK 1: Klonowanie repozytorium ===
echo ">>> Klonuję repozytorium do: $CLONE_DIR"
git clone "$REPO_URL" "$CLONE_DIR" || { echo "❌ Błąd podczas klonowania!"; exit 1; }

# === KROK 2: Tworzenie pliku .env ===
cd "$CLONE_DIR" || { echo "❌ Nie można wejść do katalogu $CLONE_DIR"; exit 1; }

echo ">>> Tworzę plik .env z ID sieci ZeroTier"
echo "ZEROTIER_NETWORK_ID=$NETWORK_IDS" > .env

# === KROK 3: Ewentualne uruchomienie Dockera ===
if [ "$ONLY_CLONE" = false ]; then
  echo ">>> Uruchamiam kontener Docker z docker-compose..."
  docker compose up -d || { echo "❌ Błąd podczas uruchamiania kontenera!"; exit 1; }
  echo "✅ Gotowe! Kontener działa w tle."
else
  echo "ℹ️  Repozytorium pobrane i przygotowane. Kontener nie został uruchomiony (tryb --only-clone)."
fi

