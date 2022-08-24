image = $(registry)/$(owner)/$(name)
img = $(image):$(git_tag)

.PHONY: img
img: tag ?= $(TAG)
img:
	@echo $(img)

dockerfile ?= Dockerfile
context ?= .

.PHONY: image
image: tag ?= $(TAG)
image:
	@$(msg) "Building $(img)..."
	@docker build -f $(dockerfile) -t $(img) $(context)

.PHONY: push
push: tag ?= $(TAG)
push:
	@$(msg) "Pushing $(img)..."
	@docker push $(img)

.PHONY: size
size: tag ?= $(TAG)
size:
	@docker inspect -f "{{ .Size }}" $(img) | numfmt --to=si

.PHONY: digest
digest: tag ?= $(TAG)
digest:
	@docker inspect -f "{{index .RepoDigests 0}}" $(img)
