FROM ubuntu:19.10

LABEL repository="https://github.com/metal-stack/action-docker-make"
LABEL maintainer="metal-stack authors <info@metal-stack.io>"

ARG DOCKER_MAKE_VERSION=v0.3.0

RUN apt-get update \
 && apt-get --yes install --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    git \
    lz4 \
    software-properties-common \
 && curl -fsSLo /usr/local/bin/docker-make https://github.com/fi-ts/docker-make/releases/download/${DOCKER_MAKE_VERSION}/docker-make-linux-amd64 \
 && chmod +x /usr/local/bin/docker-make \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu eoan stable" \
 && apt-get update \
 && apt-get --yes install --no-install-recommends docker-ce

COPY LICENSE README.md /
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
