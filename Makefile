.PHONY: build up restart down downvol logs setup shell makemigrations migrate collectstatic superuser test stop rmmigration




# DOCKER COMMANDS

build:
	docker compose build

up:
	docker compose up

restart:
	docker compose restart

stop:
	docker compose stop

down:
	docker compose down

downvol:
	docker compose down -v

logs:
	docker compose logs -f

setup: build up
	
	
	
	
# DJANGO COMMANDS

SERVICE = django-cars

shell:
	docker compose exec $(SERVICE) bash

makemigrations:
	docker compose exec $(SERVICE) python src/manage.py makemigrations --noinput

migrate:
	docker compose exec $(SERVICE) python src/manage.py migrate --noinput

collectstatic:
	docker compose exec $(SERVICE) python src/manage.py collectstatic --noinput

superuser:
	docker compose exec $(SERVICE) python src/manage.py createsuperuser

test:
	docker compose exec $(SERVICE) python src/manage.py test

reboot: makemigrations migrate restart

rmmigration:
	find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
	find . -path "*/migrations/*.pyc"  -delete
