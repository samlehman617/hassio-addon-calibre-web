ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Add env
ENV LANG C.UTF-8

LABEL \
    io.hass.name="Calibre-Web" \
    io.hass.description="Store, manage, and read your books from a web UI" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}" \
    maintainer="Sam Lehman <samlehman617@gmail.com>" \
    org.opencontainers.image.title="Calibre-Web" \
    org.opencontainers.image.description="Store, manage, and read your books from a web UI" \
    org.opencontainers.image.vendor="Sam Lehman" \
    org.opencontainers.image.authors="Sam Lehman <samlehman617@gmail.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://hub.docker.com/samlehman617/hassio-addon-calibre-web" \
    org.opencontainers.image.source="https://github.com/samlehman617/hassio-addon-calibre-web" \
    org.opencontainers.image.documentation="https://github.com/samlehman617/hassio-addon-calibre-web/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}

# Setup base

RUN apk add --no-cache -U --virtual .build-deps \
	git \
 && apk add -U --no-cache \
        jq \
	py-pip \
	python \
	python-dev \
    imagemagick \
 && mkdir /cw \
 && cd /cw \
 && git clone https://github.com/janeczku/calibre-web.git .\
 && pip install -r requirements.txt --target vendor \
 && pip install -r optional-requirements.txt --target vendor

# Copy data
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
