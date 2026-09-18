# MinIO's own images have been removed from Docker Hub, so the runtime image is
# built on Chainguard's wolfi-base. coreutils provides the GNU chroot --userspec
# used by docker-entrypoint.sh and the GNU head/tail options used by the tests;
# mc (from Wolfi) is what the compose healthchecks run ("mc ready local"); and
# bash is installed as /bin/sh because, as on the previous base, the tests drive
# the containers with "/bin/sh -c" scripts that rely on brace expansion.
FROM cgr.dev/chainguard/wolfi-base:latest
RUN apk add --no-cache bash coreutils ca-certificates-bundle mc && \
    ln -sf /bin/bash /bin/sh

ARG TARGETARCH
ARG RELEASE

RUN chmod -R 777 /usr/bin

COPY ./minio-${TARGETARCH}.${RELEASE} /usr/bin/minio
COPY ./minio-${TARGETARCH}.${RELEASE}.minisig /usr/bin/minio.minisig
COPY ./minio-${TARGETARCH}.${RELEASE}.sha256sum /usr/bin/minio.sha256sum

COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

VOLUME ["/data"]

CMD ["minio"]
