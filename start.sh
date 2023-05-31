#! /bin/sh

# adding start param for config and run with token

#set -x
# while getopts "u:r:n:t:" flag
# do
#   case "${flag}" in
#     u) user=${OPTARG};;
#     r) repo=${OPTARG};;
#     n) run_name=${OPTARG};;
#     t) token_val=${OPTARG};;
#   esac
# done
# shift $(($OPTIND - 1))
#set +x

USER=mariusciotir
REPO=terragrunt-oci
RUNNER_NAME=terragrunt-runner
GH_TOKEN=$GH_TOKEN

./config.sh --unattended --url https://github.com/$USER/$REPO --name $RUNNER_NAME --token $GH_TOKEN && ./run.sh