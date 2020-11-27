.PHONY: help
.PHONE: install remove

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

install: ## Install kubernetes dashboard
	kubectl apply -f namespace.yml
	kubectl apply -k .

remove: ## Remove kubernetes dashboard
	kubectl delete -k .
	kubectl delete namespace.yml
