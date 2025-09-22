#!/bin/sh

set -e




echo "🔄 \033[1;36m Waiting for PostgreSQL to start...\033[0m"

while ! nc -z db-cars 5432; do
    echo "⏳ \033[1;36m Waiting for database connection...\033[0m"
    sleep 2
done

echo "✅ \033[1;36m PostgreSQL is available!\033[0m"




echo "🎯 \033[1;36m Collecting static files...\033[0m"
python src/manage.py collectstatic --noinput

echo "🧬 \033[1;36m Applying database migrations...\033[0m"
python src/manage.py migrate --noinput




WORKERS=${GUNICORN_WORKERS:-$((2 * $(nproc) + 1))}
export WORKERS




echo "⚙️  \033[1;36m Starting Gunicorn with $WORKERS workers...\033[0m"




if [ "$1" = "gunicorn" ]; then
    shift
    exec gunicorn --bind 0.0.0.0:8000 --workers "$WORKERS" "$@"
else
    exec "$@"
fi