.PHONY: help
.PHONE: install-k8s remove-k8s

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

install-k8s: ## Install kubernetes dashboard
	kubectl apply -f namespace.yml
	kubectl apply -k .
	kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep dashboard-user | awk '{print $1}')

remove-k8s: ## Remove kubernetes dashboard
	kubectl delete -k .
	kubectl delete namespace.yml
