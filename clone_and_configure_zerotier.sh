#!/bin/bash

# === KONFIGURACJA ===
REPO_URL="https://github.com/komputeros/zerotier-one-docker-compose.git"   # <- Zmień na swoje repo
CLONE_DIR="zerotier-docker-config"                                   # <- Nazwa katalogu, do którego zostanie sklonowane
NETWORK_IDS="abcdefdeadbeef00 1122334455667788"               # <- Twoje sieci ZeroTier

# === KROK 1: Klonowanie repozytorium ===
echo ">>> Klonuję repozytorium do: $CLONE_DIR"
git clone "$REPO_URL" "$CLONE_DIR" || { echo "❌ Błąd podczas klonowania!"; exit 1; }

# === KROK 2: Tworzenie pliku .env ===
cd "$CLONE_DIR" || { echo "❌ Nie można wejść do katalogu $CLONE_DIR"; exit 1; }

echo ">>> Tworzę plik .env z ID sieci ZeroTier"
echo "ZEROTIER_NETWORK_ID=$NETWORK_IDS" > .env

echo "✅ Gotowe! Repozytorium sklonowane, plik .env utworzony."
echo "📂 Lokalizacja: $(pwd)"
echo "➡️  Uruchom: docker compose up -d"

