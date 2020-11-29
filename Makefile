.PHONY: help
.PHONE: git-clone-all git-pull-all

GIT_REPO=https://github.com/CloudDevOpsEMEA/msp-k8s-bigip-multi-tenant.git

HOME_DIR=/home/ubuntu
REPO_DIR=${HOME_DIR}/msp-k8s-bigip-multi-tenant

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

git-clone-all: ## Clone all git repos
	ssh master1 		'cd ${HOME_DIR} ; git clone ${GIT_REPO}'
	ssh master2 		'cd ${HOME_DIR} ; git clone ${GIT_REPO}'
	ssh master3 		'cd ${HOME_DIR} ; git clone ${GIT_REPO}'
	ssh node1   		'cd ${HOME_DIR} ; git clone ${GIT_REPO}'
	ssh node2   		'cd ${HOME_DIR} ; git clone ${GIT_REPO}'
	ssh node3   		'cd ${HOME_DIR} ; git clone ${GIT_REPO}'
	ssh operations  'cd ${HOME_DIR} ; git clone ${GIT_REPO}'

git-pull-all: ## Pull all git repos
	ssh master1 		'cd ${REPO_DIR}; git pull ; sudo updatedb'
	ssh master2 		'cd ${REPO_DIR}; git pull ; sudo updatedb'
	ssh master3 		'cd ${REPO_DIR}; git pull ; sudo updatedb'
	ssh node1   		'cd ${REPO_DIR}; git pull ; sudo updatedb'
	ssh node2   		'cd ${REPO_DIR}; git pull ; sudo updatedb'
	ssh node3   		'cd ${REPO_DIR}; git pull ; sudo updatedb'
	ssh operations  'cd ${REPO_DIR}; git pull ; sudo updatedb'
	ssh jumphost   	'cd ${REPO_DIR}; git pull ; sudo updatedb'
