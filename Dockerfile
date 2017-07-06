FROM alpine

MAINTAINER Chen Augus <tianhao.chen@gmail.com>

RUN apk update && apk add python openssl ca-certificates && wget -O- https://download.calibre-ebook.com/linux-installer.py | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

EXPOSE 8083
