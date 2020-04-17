#!/bin/bash

set -eu

cat terraform.tfstate |jq  '{endpoint: .outputs.cluster_endpoint.value}'
buildkite-agent artifact upload endpoint.json
