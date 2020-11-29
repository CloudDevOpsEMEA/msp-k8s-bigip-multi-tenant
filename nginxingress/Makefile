.PHONY: help
.PHONE: nginx-kic nginx-plus-kic

GIT_REPO=https://github.com/nginxinc/kubernetes-ingress
BUILD_DIR=/tmp

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

docker-login:
	docker login harbor.udfdemo.org -u admin -p harbor

git:
	cd ${BUILD_DIR} && git clone https://github.com/nginxinc/kubernetes-ingress
	cd ${BUILD_DIR}/kubernetes-ingress && git checkout v1.9.1

nginx-kic: docker-login git ## Build and push Nginx KIC
	cd ${BUILD_DIR}/kubernetes-ingress && make PREFIX=harbor.udfdemo.org/nginx/nginx-ingress
	
nginx-plus-kic: docker-login git ## Build and push Nginx Plus KIC
	cp certs/* cd ${BUILD_DIR}/kubernetes-ingress
	cd ${BUILD_DIR}/kubernetes-ingress && make PREFIX=harbor.udfdemo.org/nginx/nginx-plus-ingress DOCKERFILE=DockerfileForPlus
