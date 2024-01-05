ENV := development

DOCKER_COMPOSE := docker compose -f docker-compose.yml

docker_init: docker_build docker_start

docker_build:
	$(DOCKER_COMPOSE) build --no-cache

docker_start:
	$(DOCKER_COMPOSE) up -d

new:
	$(DOCKER_COMPOSE) exec api bundle exec rails new . --force --api -d mysql --skip-test

install:
	$(DOCKER_COMPOSE) exec api bundle install

db_create:
	$(DOCKER_COMPOSE) exec api rails db:create

rspec:
	$(DOCKER_COMPOSE) exec api rspec

annotate:
	$(DOCKER_COMPOSE) exec api annotate

routes:
	$(DOCKER_COMPOSE) exec api rails routes

migrate:
	$(DOCKER_COMPOSE) exec api bundle exec ridgepole -c config/database.yml -E development -f db/schemas/Schemafile --apply && \
	$(DOCKER_COMPOSE) exec api bundle exec ridgepole -c config/database.yml -E test -f db/schemas/Schemafile --apply && \
	$(DOCKER_COMPOSE) exec api annotate

rubocop:
	$(DOCKER_COMPOSE) exec api bundle exec rubocop --require rubocop-airbnb -a

edit_credentials:
	$(DOCKER_COMPOSE) exec -e EDITOR=vim api rails credentials:edit

console:
	$(DOCKER_COMPOSE) exec api rails console
