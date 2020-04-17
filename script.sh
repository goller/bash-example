#!/bin/bash
set -eo pipefail

echo "--- :package: Metadata"

export NAME=$(buildkite-agent meta-data get name)
export REGION=$(buildkite-agent meta-data get region)
buildkite-agent meta-data get cidrs

echo "+++ :package: terraform init"
terraform init

echo "+++ :package: terraform plan"
terraform plan -var="region=${REGION}" -out=${NAME}.plan

echo "+++ :package: terraform apply"
terraform apply -auto-approve ${NAME}.plan

cp terraform.tfstate /tmp

echo "+++ :package: endpoint artifact"
cat terraform.tfstate |jq  '{endpoint: .outputs.cluster_endpoint.value}' > endpoint.json
buildkite-agent artifact upload endpoint.json

echo "+++ :package: kubeconfig artifact"
cat terraform.tfstate |jq -r .outputs.kube_config.value > kubeconfig.yaml
buildkite-agent artifact upload kubeconfig.yaml
