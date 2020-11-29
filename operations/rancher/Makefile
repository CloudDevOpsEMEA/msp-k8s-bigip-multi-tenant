.PHONY: help
.PHONE: install-rancher remove-rancher

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

install-rancher: ## Install rancher dashboard
	sudo docker run -d \
		-p 8080:80 -p 8443:443	 \
		--restart=always \
		--name rancherui \
		-v ~/dockerhost-storage/rancher:/var/lib/rancher \
		--privileged \
		rancher/rancher:latest

remove-rancher: ## Remove rancher dashboard
	sudo docker kill rancherui
	sudo docker rm rancherui
	sudo docker rmi rancher/rancher:latest
