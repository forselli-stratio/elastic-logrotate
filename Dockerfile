FROM bobrik/curator:latest

USER root
ADD curator /bin/curator
ADD delete.yml /delete.yml
ADD rollover.yml /rollover.yml
ADD entrypoint.sh /entrypoint.sh

RUN apk update && \
    apk --no-cache add bash curl openssl vim strace && \ 
    chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]