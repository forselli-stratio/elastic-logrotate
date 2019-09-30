FROM alpine:3.10.2

USER root
ADD delete.sh /delete.sh
ADD rollover.sh /tmp/rollover.sh.tmp
ADD kms_utils.sh kms_utils.sh
ADD b-log.sh b-log.sh
ADD entrypoint.sh /entrypoint.sh

RUN apk update && \
    apk --no-cache add bash coreutils curl openssl vim jq gettext strace && \
    chmod +x /entrypoint.sh && \
    chmod +x /b-log.sh

ENTRYPOINT [ "/entrypoint.sh" ]