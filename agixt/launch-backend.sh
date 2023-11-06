#!/bin/sh
set -e
if [ "$DB_CONNECTED" = "true" ]; then
    echo "Connecting to database..."
    python3 DBConnection.py
fi
echo "Starting AGiXT..."
workers="${UVICORN_WORKERS:-10}"
uvicorn app:app --host 0.0.0.0 --port 7437 --workers $workers --proxy-headers