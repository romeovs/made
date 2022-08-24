compose.check:
	@echo "Checking docker-compose.yml"
	@docker compose config >/dev/null
