#!/bin/sh

echo ""
cd "${GITHUB_WORKSPACE}"

export DOCKER_MAKE_REGISTRY_LOGIN_USER="${INPUT_USERNAME}"
export DOCKER_MAKE_REGISTRY_LOGIN_PASSWORD="${INPUT_PASSWORD}"

docker-make ${INPUT_ARGS}
