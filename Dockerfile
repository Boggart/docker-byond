FROM ubuntu:latest
MAINTAINER Boggart "github.com/Boggart"
RUN dpkg --add-architecture i386 && apt-get update && apt-get -y install glibc:i386 libgcc:i386 libstdc++:i386 wget unzip && \
    cd ~/ && wget http://www.byond.com/download/build/507/507.1285_byond_linux.zip && unzip 507.1285_byond_linux.zip -d ./ && rm 507.1285_byond_linux.zip && \
    mkdir /usr/local/byond && cd byond && cp -R cfg web bin man /usr/local/byond && \
    cd .. && rm -rf ./byond && \
    ln -f -s /usr/local/byond/bin/DreamDaemon /usr/local/bin/DreamDaemon && \
    ln -f -s /usr/local/byond/bin/DreamDownload /usr/local/bin/DreamDownload && \
    ln -f -s /usr/local/byond/bin/DreamMaker /usr/local/bin/DreamMaker && \
    ln -f -s /usr/local/byond/bin/libbyond.so /usr/local/lib/libbyond.so && \
    ln -f -s /usr/local/byond/bin/libext.so /usr/local/lib/libext.so && \
    useradd -ms /bin/bash byond
USER byond
CMD ["/usr/local/bin/gobyond.sh"]