set -eo pipefail

echo "+++ :package: Metadata"

buildkite-agent meta-data get name
buildkite-agent meta-data get region
buildkite-agent meta-data get cidrs
