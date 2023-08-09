#!/usr/bin/env bash

export GIMME_ENV_PREFIX="${PWD}/_output/.gimme/envs"
export GIMME_VERSION_PREFIX="${PWD}/_output/.gimme/versions"
export GIMME_TYPE=binary
export ORIGINAL_GOPATH="${GOPATH}"

eval "$(./gimme 1.20.7)"
go run .
echo "go env GOROOT=$(go env GOROOT)"
echo "GOROOT=$GOROOT"
export GOBIN=$(go env GOROOT)/bin
pushd "${ORIGINAL_GOPATH}/src/github.com/go-critic/go-critic/cmd/gocritic" > /dev/null
    go install .
popd > /dev/null
GOCRITIC_RULEGUARD_DEBUG=true $GOBIN/gocritic check .

echo ""

eval "$(./gimme 1.21.0)"
go run .
echo "go env GOROOT=$(go env GOROOT)"
echo "GOROOT=$GOROOT"
export GOBIN=$(go env GOROOT)/bin
pushd "${ORIGINAL_GOPATH}/src/github.com/go-critic/go-critic/cmd/gocritic" > /dev/null
    go install .
popd > /dev/null
GOCRITIC_RULEGUARD_DEBUG=true $GOBIN/gocritic check .