.PHONY: help
.PHONE: nginx-kic nginx-plus-kic

GIT_REPO=https://github.com/nginxinc/kubernetes-ingress
BUILD_DIR=/tmp/nginx

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

prepare:
	docker login harbor.udfdemo.org -u admin -p harbor
	rm -rf ${BUILD_DIR}
	mkdir -p ${BUILD_DIR}
	cd ${BUILD_DIR} && git clone https://github.com/nginxinc/kubernetes-ingress
	cd ${BUILD_DIR}/kubernetes-ingress && git checkout v1.9.1

nginx-kic: prepare ## Build and push Nginx KIC
	cd ${BUILD_DIR}/kubernetes-ingress && make PREFIX=harbor.udfdemo.org/nginx/nginx-ingress
	
nginx-plus-kic: prepare ## Build and push Nginx Plus KIC
	cp certs/* cd ${BUILD_DIR}/kubernetes-ingress
	cd ${BUILD_DIR}/kubernetes-ingress && make PREFIX=harbor.udfdemo.org/nginx/nginx-plus-ingress DOCKERFILE=DockerfileForPlus
