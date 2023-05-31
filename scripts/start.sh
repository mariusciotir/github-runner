#! /bin/sh

# simply adding start param for config and run with token so there is no 

./config.sh --unattended --url https://github.com/$USER/$REPO --name $RUNNER_NAME --token $GH_TOKEN && ./run.sh