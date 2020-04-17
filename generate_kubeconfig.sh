#!/bin/bash

cat > kubeconfig << EOF
apiVersion: v1
	clusters:
	- cluster:
		insecure-skip-tls-verify: true
		server: https://127.0.0.1:6443
	  name: docker-desktop
	contexts:
	- context:
		cluster: docker-desktop
		user: docker-desktop
	  name: docker-desktop
	current-context: docker-desktop
	kind: Config
	preferences: {}
	users:
	- name: docker-desktop
	  user:
		client-certificate-data: Y2xpZW50LWNlcnQtZGF0YQ==
		client-key-data: Y2xpZW50LWtleS1kYXRh

EOF
