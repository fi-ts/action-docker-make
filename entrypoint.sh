#!/bin/sh

echo "" 
cd "${GITHUB_WORKSPACE}"

if [ ! -z "${INPUT_USERNAME}" ]; then
    echo ${INPUT_PASSWORD} | docker login -u ${INPUT_USERNAME} --password-stdin
fi

docker-make "${INPUT_ARGS}"

if [ ! -z "${INPUT_USERNAME}" ]; then
    docker logout
fi