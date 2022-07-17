ENV := development

DOCKER_COMPOSE := docker compose -f docker-compose.yml

docker_init: docker_build docker_start

docker_build:
	$(DOCKER_COMPOSE) build --no-cache

docker_start:
	$(DOCKER_COMPOSE) up -d

new:
	$(DOCKER_COMPOSE) run web bundle exec rails new . --force --api -d mysql --skip-test

install:
	$(DOCKER_COMPOSE) run web bundle install

migrate:
	$(DOCKER_COMPOSE) run web rails db:create

rspec:
	$(DOCKER_COMPOSE) run web rspec
