.PHONY: help
.PHONE: haproxy

HAPROXY_VERSION=1.4.10

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

prepare:
	docker login harbor.udfdemo.org -u admin -p harbor

haproxy: prepare ## Pull, tag and push HAProxy Ingress Controller
	docker pull haproxytech/kubernetes-ingress:${HAPROXY_VERSION}
	docker tag haproxytech/kubernetes-ingress:${HAPROXY_VERSION} harbor.udfdemo.org/haproxy/kubernetes-ingress:${HAPROXY_VERSION}
	docker push harbor.udfdemo.org/haproxy/kubernetes-ingress:${HAPROXY_VERSION}
