FROM alpine:3.10.2

ADD curator /bin/curator
ADD delete.yml /delete.yml
ADD rollover.yml /rollover.yml
ADD entrypoint.sh /entrypoint.sh

RUN apt-get update && \
    apt-get install jq telnet curl wget procps mutt gpgsm vim strace -y && \

RUN apk update && \
    apk --no-cache add bash curl openssl telnet vim strace && \

ENTRYPOINT [ "/entrypoint.sh" ]