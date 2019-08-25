
## Use alpine to run wget
## wget from busybox gets "TLS error from peer"
FROM alpine:edge AS BUILD

ENV VERSION v1.48.0

RUN set -x \
  \
  && wget -O rclone.zip https://downloads.rclone.org/$VERSION/rclone-$VERSION-linux-amd64.zip \
  && mkdir -p rclone \
  && unzip -j -d rclone rclone.zip

FROM busybox:latest

COPY --from=BUILD /rclone/rclone /usr/local/bin/rclone
ENTRYPOINT ["/usr/local/bin/rclone"]
