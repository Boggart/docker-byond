FROM boggart/alpine-apk-static-32bit
MAINTAINER Boggart "github.com/Boggart"
RUN ["/sbin/apk.static", "add", "--update", "alpine-base", "libgcc" ,"libstdc++" ,"wget", "unzip", "bash"]
RUN wget --no-check-certificate "https://dl.dropboxusercontent.com/u/83869314/ShareX/2015/05/glibc-2.21-r4.apk" && \
    apk.static add --allow-untrusted glibc-2.21-r4.apk && \
    wget --no-check-certificate "https://dl.dropboxusercontent.com/u/83869314/ShareX/2015/05/glibc-bin-2.21-r4.apk" && \
    apk.static add --allow-untrusted glibc-bin-2.21-r4.apk && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    cd ~/ && wget http://www.byond.com/download/build/507/507.1285_byond_linux.zip && unzip 507.1285_byond_linux.zip -d ./ && rm 507.1285_byond_linux.zip && \
    mkdir /usr/local/byond && cd byond && cp -R cfg web bin man /usr/local/byond && \
    cd .. && rm -rf ./byond && \
    ln -f -s /usr/local/byond/bin/DreamDaemon /usr/local/bin/DreamDaemon && \
    ln -f -s /usr/local/byond/bin/DreamDownload /usr/local/bin/DreamDownload && \
    ln -f -s /usr/local/byond/bin/DreamMaker /usr/local/bin/DreamMaker && \
    ln -f -s /usr/local/byond/bin/libbyond.so /usr/local/lib/libbyond.so && \
    ln -f -s /usr/local/byond/bin/libext.so /usr/local/lib/libext.so && \
    adduser -D -s /bin/bash byond
USER byond
CMD ["/usr/local/bin/gobyond.sh"]