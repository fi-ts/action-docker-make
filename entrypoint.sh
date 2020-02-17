#!/bin/sh

echo "" 
cd "${GITHUB_WORKSPACE}"

export REGISTRY_LOGIN_USER="${INPUT_USERNAME}"
export REGISTRY_LOGIN_PASSWORD="${INPUT_PASSWORD}"

docker-make --log-level=DEBUG "${INPUT_ARGS}"
