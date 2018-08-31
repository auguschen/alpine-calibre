FROM alpine:latest

LABEL maintainer="Chen Augus <tianhao.chen@gmail.com>"

RUN apk --no-cache add git python2 py2-pip imagemagick && \
    mkdir -p /opt/calibre /opt/calibre-library && cd /opt/calibre && \
    git clone -b master https://github.com/janeczku/calibre-web.git && \
    cd /opt/calibre/calibre-web && \
    pip install --target vendor -r requirements.txt

COPY calibre-library /opt/calibre-library

VOLUME ["/opt/calibre-library"]

EXPOSE 8083

WORKDIR /opt/calibre/calibre-web

CMD python cps.py
