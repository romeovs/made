TAG ?= HEAD
git_tag = $(shell git rev-parse --short=9 $(tag) 2>/dev/null || echo $(tag))

.PHONY: tag
tag: tag ?= $(TAG)
tag:
	@echo $(git_tag)
