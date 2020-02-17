FROM docker:19.03

LABEL repository="https://github.com/metal-stack/action-docker-make"
LABEL maintainer="Metal Stack Authors <info@metal-stack.io>"

RUN apk update \
 && apk add python py-pip git bash \
 && pip install pip --upgrade \
 && pip install --extra-index-url https://pypi.fi-ts.io docker-make

COPY LICENSE README.md /
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]