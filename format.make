prettier = $(bin)/prettier

.PHONY: format
format:
	@$(prettier) . --write

.PHONY: formatting
formatting:
	@$(prettier) . --check
