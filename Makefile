pull:
	@docker compose pull

start: pull
	@docker compose -f docker-compose.yml -f services/*.yml up -d --remove-orphans

stop:
	@docker compose stop