ARG DOCKER_MAKE_VERSION=v0.3.5
FROM metalstack/docker-make:${DOCKER_MAKE_VERSION}
LABEL repository="https://github.com/metal-stack/action-docker-make"
LABEL maintainer="metal-stack authors <info@metal-stack.io>"
COPY LICENSE README.md /
COPY entrypoint.sh /
RUN mv /docker-make /usr/local/bin/docker-make
ENTRYPOINT ["/entrypoint.sh"]
