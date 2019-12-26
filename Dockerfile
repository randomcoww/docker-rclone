FROM alpine:edge AS BUILD

ENV VERSION v1.50.2

RUN set -x \
  \
  && apk add --no-cache \
    fuse \
  \
  && wget -O rclone.zip https://downloads.rclone.org/$VERSION/rclone-$VERSION-linux-amd64.zip \
  && mkdir -p rclone \
  && unzip -j -d rclone rclone.zip \
  && cp /rclone/rclone /usr/local/bin/rclone \
  && rm -rf /rclone rclone.zip 

ENTRYPOINT ["/usr/local/bin/rclone"]
