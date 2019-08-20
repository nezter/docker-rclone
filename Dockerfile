FROM amd64/alpine

ENV WORKDIR=/workdir \
    RCLONE_VER=1.48.0 \
    BUILD_DATE=20190820T171952 \
    ARCH=amd64

LABEL build_version="Version:- ${RCLONE_VER} Build-date:- ${BUILD_DATE}"
LABEL maintainer="lucashalbert <lhalbert@lhalbert.xyz>"


RUN apk add --no-cache --update fuse fuse-dev unzip curl mdocml-apropos curl-doc && \
    curl -O https://downloads.rclone.org/rclone-current-linux-${ARCH}.zip && \
    unzip rclone-current-linux-${ARCH}.zip && \
    cd rclone-*-linux-${ARCH} && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    mkdir -p /usr/share/man/man1 && \
    cp rclone.1 /usr/share/man/man1/ && \
    makewhatis /usr/share/man && \
    apk del unzip curl && \
    cd ../ && \
    rm -f rclone-current-linux-${ARCH}.zip && \
    rm -r rclone-*-linux-${ARCH}



WORKDIR ${WORKDIR}

COPY docker-entrypoint.sh ${WORKDIR}/

ENTRYPOINT ["./docker-entrypoint.sh"]
