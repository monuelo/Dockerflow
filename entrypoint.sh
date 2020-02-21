#!/bin/sh
set -e

function main() {
  echo ""

  sanitize "${INPUT_ACTION}" "action"
  sanitize "${INPUT_NAME}" "name"
  sanitize "${INPUT_USERNAME}" "username"
  sanitize "${INPUT_PASSWORD}" "password"

  echo ${INPUT_PASSWORD} | docker login -u ${INPUT_USERNAME} --password-stdin ${INPUT_REGISTRY}

  docker logout
}

function sanitize() {
  if [ -z "${1}" ]; then
    >&2 echo "Unable to find the ${2}. Did you set with.${2}?"
    exit 1
  fi
}
