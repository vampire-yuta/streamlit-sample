default: up

up:
	docker-compose -f docker-compose.yml up -d

build:
	docker-compose build

ps:
	docker-compose ps

logs:
	docker-compose logs
