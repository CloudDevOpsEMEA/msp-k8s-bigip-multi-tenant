.PHONY: help
.PHONE: install remove

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

install-k8s: ## Install kubernetes dashboard
	kubectl apply -f namespace.yml
	kubectl apply -k .

remove-k8s: ## Remove kubernetes dashboard
	kubectl delete -k .
	kubectl delete namespace.yml

install-rancher: ## Install rancher dashboard
	sudo docker run -d \
		--network=host \
		--restart=always \
		--name f5rancher \
		-v ~/dockerhost-storage/rancher:/var/lib/rancher \
		--privileged \
		rancher/rancher:latest

remove-rancher: ## Remove rancher dashboard
	sudo docker kill f5rancher
	sudo docker rm f5rancher
	sudo docker rmi rancher/rancher:latest
