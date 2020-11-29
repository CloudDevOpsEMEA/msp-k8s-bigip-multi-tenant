.PHONY: help
.PHONE: kubernetes-ingress

K8S_INGRESS_RELEASE=ingress-nginx-3.12.0

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

prepare:
	docker login harbor.udfdemo.org -u admin -p harbor

kubernetes-ingress: prepare ## Pull, tag and push Kubernetes Ingress Controller
	docker pull k8s.gcr.io/ingress-nginx/${K8S_INGRESS_RELEASE}
	docker tag k8s.gcr.io/ingress-nginx/${K8S_INGRESS_RELEASE} harbor.udfdemo.org/kubernetes/${K8S_INGRESS_RELEASE}
	docker push harbor.udfdemo.org/kubernetes/${K8S_INGRESS_RELEASE}
