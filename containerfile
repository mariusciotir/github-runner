FROM docker.io/library/ubuntu:mantic

RUN apt-get update -y && apt-get upgrade -y && useradd -m docker && \
    apt-get install -y --no-install-recommends curl ca-certificates sudo && apt-get clean

RUN mkdir -p ./actions-runner && cd ./actions-runner

#COPY  actions-runner/  /actions-runner
ENV $PATH=/usr/bin/:
WORKDIR /actions-runner

RUN curl -O -L https://github.com/actions/runner/releases/download/v2.304.0/actions-runner-linux-x64-2.304.0.tar.gz \
    && tar xvzf ./actions-runner-linux-x64-2.304.0.tar.gz



COPY start.sh /actions-runner/
RUN chmod +x config.sh run.sh env.sh start.sh


RUN ./bin/installdependencies.sh
RUN chown -R docker /actions-runner

USER docker

# set the entrypoint to start.sh to run both config.sh and run.sh
ENTRYPOINT ["./start.sh"]
