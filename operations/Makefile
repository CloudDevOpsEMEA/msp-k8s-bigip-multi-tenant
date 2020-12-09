# Makefile

.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

LOGGING_DIR=./logging
LOGGING_NAMESPACE=logging
FLUENT_BIT_CHART_DIR=${LOGGING_DIR}/charts/fluent-bit
FLUENT_BIT_VALUES_1=${LOGGING_DIR}/fluentbit-udf-values-cluster1.yaml
FLUENT_BIT_VALUES_2=${LOGGING_DIR}/fluentbit-udf-values-cluster2.yaml
FLUENT_BIT_VALUES_2=${LOGGING_DIR}/fluentbit-udf-values-cluster3.yaml


rancher-ui:  ## Install rancher UI
	sudo docker run -d \
		--network=host \
		--restart=always \
		--name rancherui \
		-v ~/dockerhost-storage/rancher:/var/lib/rancher \
		--privileged \
		rancher/rancher:latest

install-es-kibana:  ## Install elasticsearch and kibana
	curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
	echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
	sudo apt-get update -y
	sudo apt-get install  -y elasticsearch kibana
	sudo systemctl start elasticsearch
	sudo systemctl enable elasticsearch
	sudo systemctl start kibana
	sudo systemctl enable kibana

config-es-kibana:  ## Install elasticsearch and kibana
	sudo cp ${LOGGING_DIR}/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
	sudo chown root:elasticsearch /etc/elasticsearch/elasticsearch.yml
	sudo chmod 660 /etc/elasticsearch/elasticsearch.yml
	sudo cp ${LOGGING_DIR}/kibana.yml /etc/kibana/kibana.yml
	sudo chown root:kibana /etc/kibana/kibana.yml
	sudo chmod 660 /etc/kibana/kibana.yml
	sudo systemctl restart elasticsearch
	sudo systemctl restart kibana

install-cerebro:  ## Install elasticsearch web admin tool cerebro
	sudo docker run -d \
		-p 9000:9000 \
		--restart=always \
		--name cerebro \
		--privileged \
		lmenezes/cerebro:latest

remove-cerebro:  ## Unistall elasticsearch web admin tool cerebro
	sudo docker kill cerebro
	sudo docker rm cerebro
	sudo docker rmi lmenezes/cerebro:latest

install-fluentbit-1:  ## Deploy fluentbit on cluster 1
	kubectl apply -f ${LOGGING_DIR}/00_namespace.yaml
	helm install fluent-bit ${FLUENT_BIT_CHART_DIR} --values ${FLUENT_BIT_VALUES_1}	--namespace=${LOGGING_NAMESPACE} --wait

install-fluentbit-2:  ## Deploy fluentbit on cluster 2
	kubectl apply -f ${LOGGING_DIR}/00_namespace.yaml
	helm install fluent-bit ${FLUENT_BIT_CHART_DIR} --values ${FLUENT_BIT_VALUES_2}	--namespace=${LOGGING_NAMESPACE} --wait

install-fluentbit-3:  ## Deploy fluentbit on cluster 3
	kubectl apply -f ${LOGGING_DIR}/00_namespace.yaml
	helm install fluent-bit ${FLUENT_BIT_CHART_DIR} --values ${FLUENT_BIT_VALUES_3}	--namespace=${LOGGING_NAMESPACE} --wait

remove-fluentbit-1:  ## Remove fluentbit from cluster 1
	helm uninstall fluent-bit --namespace=${LOGGING_NAMESPACE} || true
	kubectl delete -f 00_namespace.yaml || true

remove-fluentbit-2:  ## Remove fluentbit from cluster 2
	helm uninstall fluent-bit --namespace=${LOGGING_NAMESPACE} || true
	kubectl delete -f 00_namespace.yaml || true

remove-fluentbit-3:  ## Remove fluentbit from cluster 3
	helm uninstall fluent-bit --namespace=${LOGGING_NAMESPACE} || true
	kubectl delete -f 00_namespace.yaml || true

install-prometheus-grafana:  ## Install prometheus and grafana
	sudo apt-get install -y prometheus prometheus-node-exporter prometheus-pushgateway prometheus-alertmanager
	sudo snap install grafana

install-harbor:  ## Install harbor docker registry
	cd /home/ubuntu/harbor ; sudo ./install.sh --with-clair
