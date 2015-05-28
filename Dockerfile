FROM gliderlabs/alpine:latest
MAINTAINER Boggart "github.com/Boggart"
RUN apk add --update git && \
    cd ~/ && wget http://www.byond.com/download/build/507/507.1285_byond_linux.zip && unzip 507.1285_byond_linux.zip -d ./ && rm 507.1285_byond_linux.zip && \
    mkdir /usr/local/byond && cp -R cfg web bin man /usr/local/byond && \
    ln -f -s /usr/local/byond/bin/DreamDaemon /usr/local/bin/DreamDaemon && \
    ln -f -s /usr/local/byond/bin/DreamDownload /usr/local/bin/DreamDownload && \
    ln -f -s /usr/local/byond/bin/DreamMaker /usr/local/bin/DreamMaker && \
    ln -f -s /usr/local/byond/man/man6/DreamDaemon.6 /usr/share/man/man6/DreamDaemon.6 && \
    ln -f -s /usr/local/byond/man/man6/DreamMaker.6 /usr/share/man/man6/DreamMaker.6 && \
    ln -f -s /usr/local/byond/bin/libbyond.so /usr/local/lib/libbyond.so && \
    ln -f -s /usr/local/byond/bin/libext.so /usr/local/lib/libext.so && \
    wget http://www.byond.com/download/build/gcc/libstdc++-libc6.2-2.so.3 && mv libstdc++-libc6.2-2.so.3 /usr/local/lib/libstdc++-libc6.2-2.so.3 && \
    wget http://www.byond.com/download/build/gcc/libstdc++.so.5 && mv libstdc++.so.5 /usr/local/lib/libstdc++.so.5 && \
    rm -rf /var/cache/apk/* && rm /sbin/apk && \
    adduser -D -s /bin/bash byond
USER byond
CMD ["/usr/local/bin/gobyond.sh"]