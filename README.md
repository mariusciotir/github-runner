# Self-hosted GitHub Runner as a container

Builds cotainer image to run a selfhosted GitHub Actions without using compose or injecting secrets



## Build container image 

```
podman build --env=RUNNER_VERSION=2.304.0 -t speed:6 -f containerfile
```

## podman run with env vars example


1. env file parameters:

```
RUNNER_VERSION=
USER=
REPO=
RUNNER_NAME=
```

2. 

GH_TOKEN

```
podman run --env-file env -e GH_TOKEN=$GH_TOKEN -d --name github-test localhost/test:1
```