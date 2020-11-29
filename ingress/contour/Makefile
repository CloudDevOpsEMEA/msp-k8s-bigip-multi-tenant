.PHONY: help
.PHONE: contour

CONTOUR_VERSION=1.4.10

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

prepare:
	docker login harbor.udfdemo.org -u admin -p harbor

contour: prepare ## Pull, tag and push Contour Ingress Controller
	docker pull projectcontour/contour:${CONTOUR_VERSION}
	docker tag projectcontour/contour:${CONTOUR_VERSION} harbor.udfdemo.org/contour/contour:${CONTOUR_VERSION}
	docker push harbor.udfdemo.org/contour/contour:${CONTOUR_VERSION}
