#does not work with Alpine
FROM docker.io/library/ubuntu:mantic

#add docker user and 
RUN apt-get update -y && apt-get upgrade -y && useradd -m ghrunner && \
    apt-get install -y --no-install-recommends curl ca-certificates && apt-get clean

RUN mkdir -p ./actions-runner && cd ./actions-runner

WORKDIR /actions-runner

# get the required version and untar 
RUN curl -O -L https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-x64-$RUNNER_VERSION.tar.gz \
    && tar xvzf ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz

# add start to container
COPY ./scripts/start.sh /actions-runner/
RUN chmod +x start.sh


RUN ./bin/installdependencies.sh

# 
USER ghrunner

# set the entrypoint to start.sh to run both config.sh and run.sh
ENTRYPOINT ["./start.sh"]