FROM bobrik/curator:latest

USER root
ADD delete.sh /
ADD rollover.sh /

RUN apk update && \
    apk --no-cache add bash curl openssl vim strace && \ 
    chmod +x /entrypoint.sh && \
    chmod +x /delete.sh && \
    chmod +x rollover.sh

ENTRYPOINT [ "/entrypoint.sh" ]