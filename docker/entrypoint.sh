#!/bin/sh
set -e

# Várakozás az adatbázisra
/app/wait-for-it.sh db 5432

# Migráció futtatása
echo "Futtatom a migrációkat..."
#python manage.py migrate

# Adatok betöltése az SQL fájlból
echo "Betöltöm az adatokat az SQL fájlból..."
PGPASSWORD=$POSTGRES_PASSWORD psql -h $DB_HOST -U $POSTGRES_USER -d $POSTGRES_DB -f /app/${PROJECT_NAME}/data.sql

# Szerver indítása
echo "Indítom a Django szervert..."
python manage.py runserver 0.0.0.0:8000
