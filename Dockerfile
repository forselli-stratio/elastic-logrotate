FROM bobrik/curator:latest

USER root
ADD delete.sh /
ADD rollover.sh /
ADD kms_utils.sh /
ADD b-log.sh /

RUN apk update && \
    apk --no-cache add bash curl openssl vim strace && \ 
    chmod +x /entrypoint.sh && \
    chmod +x /delete.sh && \
    chmod +x rollover.sh

ENTRYPOINT [ "/entrypoint.sh" ]