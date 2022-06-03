prettier = $(bin)/prettier

.PHONY: format
format:
	@$(msg) "Formatting files..."
	@$(prettier) . --write

.PHONY: formatting
formatting:
	@$(msg) "Checking format..."
	@$(prettier) . --check
