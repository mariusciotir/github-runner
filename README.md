# Self hosted GitHub Runner






podman run -d localhost/speed:4 -u mariusciotir -r terragrunt-oci -n terragrunt-runner -t $GH_TOKEN

--env-file