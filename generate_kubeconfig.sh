#!/bin/bash

set -eu

cat terraform.tfstate |jq -r .outputs.kube_config.value > kubeconfig.yaml
buildkite-agent artifact upload kubeconfig.yaml
