#! /bin/bash

set -euxo pipefail

TAG="sha-${1}"

charmcraft pack

juju deploy \
    ./ubuntu-metrics_ubuntu-22.04-amd64.charm \
    --model=desktop \
    --resource "image=ghcr.io/tim-hm/ubuntu-report:$TAG"
