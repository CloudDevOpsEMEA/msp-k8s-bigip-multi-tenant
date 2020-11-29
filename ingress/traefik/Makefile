.PHONY: help
.PHONE: traefik

TRAEFIK_VERSION=v2.3.4

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

prepare:
	docker login harbor.udfdemo.org -u admin -p harbor

traefik: prepare ## Pull, tag and push Traefik Ingress Controller
	docker pull traefik:${TRAEFIK_VERSION}
	docker tag traefik:${TRAEFIK_VERSION} harbor.udfdemo.org/traefik:${TRAEFIK_VERSION}
	docker push harbor.udfdemo.org/traefik:${TRAEFIK_VERSION}
