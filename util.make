.PHONY: made.update
made.update:
	@$(msg) "Updating made..."
	@cd .made ; git fetch ; git reset --hard origin/main
