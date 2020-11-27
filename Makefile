.PHONY: help
.PHONE: git-pull-all

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

git-pull-all: ## Pull all git repos
	ssh master1 'cd /home/ubuntu/msp-k8s-bigip-multi-tenant ; git pull'
	ssh master2 'cd /home/ubuntu/msp-k8s-bigip-multi-tenant ; git pull'
	ssh master3 'cd /home/ubuntu/msp-k8s-bigip-multi-tenant ; git pull'
	ssh node1 'cd /home/ubuntu/msp-k8s-bigip-multi-tenant ; git pull'
	ssh node2 'cd /home/ubuntu/msp-k8s-bigip-multi-tenant ; git pull'
	ssh node3 'cd /home/ubuntu/msp-k8s-bigip-multi-tenant ; git pull'
