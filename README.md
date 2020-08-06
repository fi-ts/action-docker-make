# GitHub Action for `docker-make`

Wraps [docker-make](https://github.com/fi-ts/docker-make) as a GitHub action.

## Inputs

### `username`

Username for the registry.

### `password`

Password for the registry.

### `args`

Command and/or arguments to pass to `docker-make`.

## Example usage

```yaml
- uses: actions/checkout@v3
- name: Run docker-make
  uses: fi-ts/action-docker-make@v0.3.4
  with:
    username: "dockerhubuser"
    password: "dockerhubpassword"
    args: --summary
```

## Docker-make usage

```
usage: docker-make [-h] [-c CONFIG_FILE] [--log-level LOG_LEVEL]
                   [--log-format LOG_FORMAT] [--show-sensible-console-output]
                   [-v] [-B] [--show-linting-rules] [-x EXCLUDE_LINTING_RULES]
                   [-b BUILD_ONLY_NAMES [BUILD_ONLY_NAMES ...]] [-f FILE]
                   [--dockerfile DOCKERFILE]
                   [--registries-file REGISTRIES_FILE]
                   [--push-only-to-defined-registries]
                   [--push-only-to-specific-git-projects]
                   [-l | -L | --no-lint] [--only-lint] [-n] [-N] [--no-cache]
                   [--skip-registry-auth] [-d] [-p] [-s]
                   [--create-parent-label]
                   [--parent-label-name PARENT_LABEL_NAME]
                   [--create-git-remote-url-label]
                   [--git-remote-url-label-name GIT_REMOTE_URL_LABEL_NAME]
                   [--create-git-sha1-label]
                   [--git-sha1-label-name GIT_SHA1_LABEL_NAME]
                   [--create-built-from-scratch-label]
                   [--built-from-scratch-label-name BUILT_FROM_SCRATCH_LABEL_NAME]
                   [-w WORK_DIR] [--label [LABELS [LABELS ...]]]
                   [--build-arg [DOCKER_BUILD_ARGS [DOCKER_BUILD_ARGS ...]]]

Build containers with tags and different build-args with Docker. Args that
start with '--' (eg. --log-level) can also be set in a config file
(./config.yaml or ~/.docker-make/config.yaml or /etc/docker-make/config.yaml
or specified via -c). The config file uses YAML syntax and must represent a
YAML 'mapping' (for details, see http://learn.getgrav.org/advanced/yaml). If
an arg is specified in more than one place, then commandline values override
environment variables which override config file values which override
defaults.

optional arguments:
  -h, --help            show this help message and exit
  -c CONFIG_FILE, --config-file CONFIG_FILE
                        path to a docker-make config file
  --log-level LOG_LEVEL
                        defines the python logger's log level [env var:
                        DOCKER_MAKE_LOG_LEVEL]
  --log-format LOG_FORMAT
                        defines the python logger's log format [env var:
                        DOCKER_MAKE_LOG_FORMAT]
  --show-sensible-console-output
                        Prevents output with sensible information (e.g.
                        credentials) in console output [env var:
                        DOCKER_MAKE_SHOW_SENSIBLE_CONSOLE_OUTPUT]
  -v, --version         show program's version number and exit [env var:
                        DOCKER_MAKE_SHOW_VERSION]
  -B, --show-builds     show all builds and exit [env var:
                        DOCKER_MAKE_SHOW_BUILDS]
  --show-linting-rules  show all linting rules and exit [env var:
                        DOCKER_MAKE_SHOW_LINTING_RULES]
  -x EXCLUDE_LINTING_RULES, --exclude-linting-rules EXCLUDE_LINTING_RULES
                        excludes the given linting rules (comma-separated,
                        multiple are appended) [env var:
                        DOCKER_MAKE_EXCLUDE_LINTING_RULES]
  -b BUILD_ONLY_NAMES [BUILD_ONLY_NAMES ...], --build-only BUILD_ONLY_NAMES [BUILD_ONLY_NAMES ...]
                        build only given builds [env var:
                        DOCKER_MAKE_BUILD_ONLY]
  -f FILE, --file FILE  specify an alternative docker-make file [env var:
                        DOCKER_MAKE_FILE]
  --dockerfile DOCKERFILE
                        specify an alternative name for Dockerfile in working
                        directory [env var: DOCKER_MAKE_DOCKERFILE]
  --registries-file REGISTRIES_FILE
                        specify an alternative path for registries.yaml [env
                        var: DOCKER_MAKE_REGISTRIES_FILE]
  --push-only-to-defined-registries
                        pushes images only to registries defined in
                        registries.yaml [env var:
                        DOCKER_MAKE_PUSH_ONLY_TO_DEFINED_REGISTRIES]
  --push-only-to-specific-git-projects
                        pushes images only to registry git projects defined in
                        registries.yaml [env var:
                        DOCKER_MAKE_PUSH_ONLY_TO_SPECIFIC_GIT_PROJECTS]
  -l, --lint            lint given Dockerfile, fail on errors. [env var:
                        DOCKER_MAKE_LINT]
  -L, --Lint            lint given Dockerfile, proceed on errors. [env var:
                        DOCKER_MAKE_LINT_AND_PROCEED]
  --no-lint             no linting of the Dockerfile. [env var:
                        DOCKER_MAKE_NO_LINT]
  --only-lint           only lint and exit. [env var: DOCKER_MAKE_ONLY_LINT]
  -n, --no-push         only build the images but do not push the images to
                        the registry-host [env var: DOCKER_MAKE_NO_PUSH]
  -N, --no-pull         during build do not pull the parent image from the
                        registry-host [env var: DOCKER_MAKE_NO_PULL]
  --no-cache            do not use cache when building the image [env var:
                        DOCKER_MAKE_NO_CACHE]
  --skip-registry-auth  skips registry authentication and just tries to push
                        to the registry defined [env var:
                        DOCKER_MAKE_SKIP_REGISTRY_AUTH]
  -d, --dry-run         only show what docker-make would do but do not execute
                        commands with an impact [env var: DOCKER_MAKE_DRY_RUN]
  -p, --purge           purge all previous created images __before__ running
                        the actual build. Purge forcefully removes the docker
                        images. IMPORTANT: This is not recommended for
                        containers which have children [env var:
                        DOCKER_MAKE_PURGE]
  -s, --summary         print a markdown formatted summary of this build,
                        which can be added to your documentation [env var:
                        DOCKER_MAKE_SUMMARY]
  --create-parent-label
                        creates a label with the image parents of the
                        resulting docker image [env var:
                        DOCKER_MAKE_CREATE_PARENT_LABEL]
  --parent-label-name PARENT_LABEL_NAME
                        the parent build urls label name [env var:
                        DOCKER_MAKE_PARENT_LABEL_NAME]
  --create-git-remote-url-label
                        creates a label with the git remote url when pushing
                        from git folder [env var:
                        DOCKER_MAKE_CREATE_GIT_REMOTE_URL_LABEL]
  --git-remote-url-label-name GIT_REMOTE_URL_LABEL_NAME
                        the git remote url label name [env var:
                        DOCKER_MAKE_GIT_REMOTE_URL_LABEL_NAME]
  --create-git-sha1-label
                        creates a label with the git hash when pushing from
                        git folder [env var:
                        DOCKER_MAKE_CREATE_GIT_SHA1_LABEL]
  --git-sha1-label-name GIT_SHA1_LABEL_NAME
                        the git sha1 label name [env var:
                        DOCKER_MAKE_GIT_SHA1_LABEL_NAME]
  --create-built-from-scratch-label
                        creates a label that indicates whether the container
                        was built from scratch or not [env var:
                        DOCKER_MAKE_CREATE_BUILT_FROM_SCRATCH_LABEL]
  --built-from-scratch-label-name BUILT_FROM_SCRATCH_LABEL_NAME
                        the built from scratch label name [env var:
                        DOCKER_MAKE_BUILT_FROM_SCRATCH_LABEL_NAME]
  -w WORK_DIR, --work-dir WORK_DIR
                        change the working directory (defaults to .) [env var:
                        DOCKER_MAKE_WORK_DIR]
  --label [LABELS [LABELS ...]]
                        labels attached to the resulting container images [env
                        var: DOCKER_MAKE_LABEL]
  --build-arg [DOCKER_BUILD_ARGS [DOCKER_BUILD_ARGS ...]]
                        any valid Docker build parameter like "--build-arg
                        XYZ=abc" [env var: DOCKER_MAKE_BUILD_ARG]
```

## License

[mit]: https://opensource.org/licenses/MIT

This project is open source software released under the [MIT license][mit].