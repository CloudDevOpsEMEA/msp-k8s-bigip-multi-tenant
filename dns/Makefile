# Makefile

.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

.PHONY: configure-dns install

configure-dns:  ## Change DNS server settings
	sudo apt-get install -y dnsutils ldnsutils
	sudo systemctl disable --now systemd-resolved
	sudo rm -rf /etc/resolv.conf
	sudo cp ./resolv.conf /etc/resolv.conf

install:  ## Install DNSmasq
	sudo apt-get install -y dnsmasq dnsutils ldnsutils
	sudo cp ./dnsmasq.conf /etc/dnsmasq.conf
	sudo systemctl restart dnsmasq
