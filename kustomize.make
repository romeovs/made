.PHONY: deploy
deploy: set apply

.PHONY: set
set: tag ?= $(TAG)
set: service ?= web
set: folder ?= kustomize/services/$(service) 
set:
	@$(_check)
	@$(msg) "Setting service \`$(service)\` image to \`$(img)\`"
	@cd $(folder) && kustomize edit set image $(img)

.PHONY: apply
apply: tag ?= $(TAG)
apply: env ?= preview
apply:
	@$(print)  "Applying \`$(env)\` in 3s..."
	@sleep 1
	@$(cprint) "Applying \`$(env)\` in 2s..."
	@sleep 1
	@$(cprint) "Applying \`$(env)\` in 1s..."
	@sleep 1
	@$(cprint) "Applying now!"
	@$(end)
	@sleep 0.5
	@env $$(cat .env.local 2>/dev/null || true) kubectl apply --context=$(env) -k kustomize/env/$(env)

.PHONY: status
status: env ?= preview
status: timeout ?= 180s
status:
	@$(msg) "Waiting for rollout to finish..."
	@kubectl --context=$(env) rollout status --timeout=$(timeout) deployment web

.PHONY: rollout
rollout: image push deploy
