# MinIO's own images have been removed from Docker Hub, so the runtime image is
# built on Chainguard's wolfi-base. coreutils provides the GNU chroot --userspec
# used by docker-entrypoint.sh and the GNU head/tail options used by the tests.
FROM cgr.dev/chainguard/wolfi-base:latest
RUN apk add --no-cache coreutils ca-certificates-bundle

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
