#!/bin/bash
set -eo pipefail

echo "--- :package: Metadata"

export NAME=$(buildkite-agent meta-data get name)
export REGION=$(buildkite-agent meta-data get region)
buildkite-agent meta-data get cidrs

echo "+++ :package: terraform"

terraform plan -var="region=${REGION}" -out=${NAME}.plan
terraform apply ${NAME}.plan
cp terraform.state /tmp
