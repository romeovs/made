image = $(registry)/$(owner)/$(name)
img = $(image):$(git_tag)

_check = function __check { if [ "$(name)" = "TODO" ]; then echo "Error: \`name\` not set in Makefile"; exit 1; fi }; __check

.PHONY: img
img: tag ?= $(TAG)
img:
	@echo $(img)

.PHONY: image
image: tag ?= $(TAG)
image: dockerfile ?= Dockerfile
image:
	@$(msg) "Building $(img)..."
	@docker build -f $(dockerfile) -t $(img) .

.PHONY: push
push: tag ?= $(TAG)
push:
	@$(msg) "Pushing $(img)..."
	@docker push $(img)

.PHONY: size
size: tag ?= $(TAG)
size:
	@docker inspect -f "{{ .Size }}" $(img) | numfmt --to=si
