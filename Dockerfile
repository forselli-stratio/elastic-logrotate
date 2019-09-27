FROM alpine:3.10.2

USER root
ADD delete.sh delete.sh 
ADD rollover.sh rollover.sh
ADD kms_utils.sh kms_utils.sh
ADD b-log.sh b-log.sh
ADD entrypoint.sh /entrypoint.sh

RUN apk update && \
    apk --no-cache add bash curl openssl vim jq strace && \ 
    chmod +x /entrypoint.sh && \
    chmod +x /delete.sh && \
    chmod +x /b-log.sh && \
    chmod +x rollover.sh

ENTRYPOINT [ "/entrypoint.sh" ]