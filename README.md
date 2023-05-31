# Self-hosted GitHub Runner as a container

Builds cotainer image to run a selfhosted GitHub Actions without using compose or injecting secrets



## Build container image 

```
podman build --env=RUNNER_VERSION=2.304.0 -t gh_runner:0.7 -f containerfile
```

## Prerequisites


1. env file parameters:

```
USER=
REPO=
RUNNER_NAME=
```

2. Set GitHub Actions runner token (if expired you'll )
```
export GH_TOKEN=<>
```

## Run container with token and dettached

If container needs to be recreated, you will need to get a new token from GitHub


```
podman run --env-file env -e GH_TOKEN=$GH_TOKEN -d --name github-test localhost/test:1
```

3. test
```
docker logs -f github-test
```