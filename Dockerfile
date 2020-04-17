FROM ubuntu:19.10

LABEL repository="https://github.com/metal-stack/action-docker-make"
LABEL maintainer="Metal Stack Authors <info@metal-stack.io>"

RUN apt-get update \
 && apt-get --yes install --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    python \
    python-pip \
    git \
    lz4 \
 && pip install pip --upgrade \
 && pip install setuptools \
 && pip install --extra-index-url https://pypi.fi-ts.io docker-make \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu eoan stable" \
 && apt-get update \
 && apt-get --yes install --no-install-recommends docker-ce

COPY LICENSE README.md /
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]