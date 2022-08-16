ENV := development

DOCKER_COMPOSE := docker compose -f docker-compose.yml

docker_init: docker_build docker_start

docker_build:
	$(DOCKER_COMPOSE) build --no-cache

docker_start:
	$(DOCKER_COMPOSE) up -d

new:
	$(DOCKER_COMPOSE) run api bundle exec rails new . --force --api -d mysql --skip-test

install:
	$(DOCKER_COMPOSE) run api bundle install

db_create:
	$(DOCKER_COMPOSE) run api rails db:create

rspec:
	$(DOCKER_COMPOSE) run api rspec

annotate:
	$(DOCKER_COMPOSE) run api annotate --routes --models

migrate:
	$(DOCKER_COMPOSE) run api bundle exec ridgepole -c config/database.yml -E development -f db/schemas/Schemafile --apply && \
	$(DOCKER_COMPOSE) run api bundle exec ridgepole -c config/database.yml -E test -f db/schemas/Schemafile --apply

rubocop:
	$(DOCKER_COMPOSE) run api bundle exec rubocop --require rubocop-airbnb -a

edit_credentials:
	$(DOCKER_COMPOSE) run -e EDITOR=vim api rails credentials:edit
