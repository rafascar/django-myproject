help:
	@echo 'Available commands:'
	@echo ''
	@echo 'help .............................. This screen'
	@echo 'setup ............................. Build services and run initial migrations'
	@echo 'build ............................. Build or rebuild services'
	@echo 'makemigrations .................... Runs python manage.py makemigrations'
	@echo 'migrate ........................... Runs all migrations'
	@echo 'run ............................... Runs the webserver'
	@echo 'psql .............................. Run postgresql console'
	@echo 'pgcli ............................. Run pgcli console'
	@echo 'start-<name> ...................... Start <name> service'
	@echo 'test .............................. Run tests with pytest'
	@echo ''

setup: build migrate

build:
	docker-compose build

makemigrations:
	./bin/run.sh python manage.py makemigrations

migrate:
	./bin/run.sh python manage.py migrate

run:
	docker-compose up

psql: start-db
	docker-compose run db psql -U postgres -h db -p 5432 postgres

pgcli: start-db
	docker-compose run web pgcli -U postgres -h db -p 5432 postgres

start-%:
	@docker-compose up -d $(@:start-%=%)

test:
	docker-compose run web pytest

.PHONY: setup
