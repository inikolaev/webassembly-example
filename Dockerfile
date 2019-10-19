FROM alpine:latest

RUN apk --no-cache \
        --update \
        --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
        --repository http://dl-3.alpinelinux.org/alpine/edge/main/ \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        --allow-untrusted \
        add \
          binaryen \
          clang \
          # emscripten \
          llvm4 \
    && rm -f /var/cache/apk/*

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
