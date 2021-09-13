# Github action workflow runner
# Run with --env RUNNER_REPO_URL=... and RUNNER_TOKEN=...
FROM ubuntu:18.04

ENV RUNNER_TARBALL=https://github.com/actions/runner/releases/download/v2.281.1/actions-runner-linux-x64-2.281.1.tar.gz

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl libicu-dev

RUN addgroup --gid 1000 ingebrigtsen
RUN adduser --uid 1000 --gid 1000 --home /home/ingebrigtsen --shell /bin/bash ingebrigtsen

RUN mkdir /home/ingebrigtsen/runner
WORKDIR /home/ingebrigtsen/runner

COPY entry.sh entry.sh

RUN curl -o actions-runner.tar.gz -L ${RUNNER_TARBALL}
RUN tar -xzf ./actions-runner.tar.gz

RUN chown -R ingebrigtsen:ingebrigtsen .
USER ingebrigtsen

ENTRYPOINT [ "./entry.sh" ]