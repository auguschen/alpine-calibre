FROM alpine:latest

LABEL maintainer="Chen Augus <tianhao.chen@gmail.com>"

RUN apk --no-cache add git python2 py2-pip imagemagick && \
    mkdir -p /opt/calibre /opt/calibre-library && cd /opt/calibre && \
    git clone -b master https://github.com/janeczku/calibre-web.git && \
    cd /opt/calibre/calibre-web && \
    pip install --target vendor -r requirements.txt 
    # no gcc right now. add this in next release.
    # && \
    # pip install --target vendor -r optional-requirements.txt

COPY calibre-library /opt/calibre-library
COPY scripts/entrypoint.sh /opt/calibre/calibre-web/entrypoint.sh

VOLUME ["/opt/calibre-library"]

EXPOSE 8083

WORKDIR /opt/calibre/calibre-web

ENTRYPOINT [ "sh", "/opt/calibre/calibre-web/entrypoint.sh" ]