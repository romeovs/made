typescript = $(bin)/tsc

typecheck_flags ?=

.PHONY: typecheck
typecheck:
	@$(typescript) --noEmit --outDir node_modules/.cache $(typecheck_flags)

.PHONY: typecheck.watch
typecheck.watch: typecheck_flags += --watch
typecheck.watch: typecheck
