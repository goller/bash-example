#!/bin/bash

set -eu

cat > endpoint.json << EOF
{"endpoint": "example.com"}
EOF

buildkite-agent artifact upload endpoint.json
