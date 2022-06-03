.PHONY: deploy
deploy: set apply

.PHONY: set
set: tag ?= $(TAG)
set: service ?= web
set: folder ?= kustomize/services/$(service) 
set:
	@$(_check)
	@echo "Setting service \`$(service)\` image to \`$(img)\`"
	@cd $(folder) && kustomize edit set image $(img)

.PHONY: apply
apply: tag ?= $(TAG)
apply: env ?= preview
apply:
	@printf "Applying \`$(env)\` in 3s..."
	@sleep 1
	@printf "\rApplying \`$(env)\` in 2s..."
	@sleep 1
	@printf "\rApplying \`$(env)\` in 1s..."
	@sleep 1
	@printf "\rApplying now!                \n"
	@sleep 0.5
	@env $$(cat .env.local 2>/dev/null || true) kubectl apply --context=$(env) -k kustomize/env/$(env)

.PHONY: status
status: env ?= preview
status: timeout ?= 180s
status:
	@kubectl --context=$(env) rollout status --timeout=$(timeout) deployment web

.PHONY: rollout
rollout: image push deploy
