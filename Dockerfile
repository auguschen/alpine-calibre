FROM alpine:latest

LABEL maintainer="Chen Augus <tianhao.chen@gmail.com>"

RUN apk --no-cache add git nginx python2 py2-pip py2-lxml imagemagick6 && \
    mkdir -p /opt/calibre /opt/calibre-library && cd /opt/calibre && \
    git clone -b master https://github.com/janeczku/calibre-web.git && \
    cd /opt/calibre/calibre-web && mkdir -p /run/nginx && \
    pip install --upgrade pip && \
    pip install --target vendor -r requirements.txt 

COPY calibre-library /opt/calibre-library
COPY scripts/entrypoint.sh /opt/calibre/calibre-web/entrypoint.sh

VOLUME ["/etc/nginx", "/opt/calibre-library"]

EXPOSE 80 443 8083

WORKDIR /opt/calibre/calibre-web

ENTRYPOINT [ "sh", "/opt/calibre/calibre-web/entrypoint.sh" ]