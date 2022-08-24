compose.check:
	@$(msg) "Checking docker-compose.yml"
	@docker compose config >/dev/null
