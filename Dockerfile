FROM i386/ubuntu:18.04

ARG MY_UID

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:jonathonf/firefox-esr-52 && \
    add-apt-repository -y ppa:webupd8team/java && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer firefox-esr ca-certificates-java && \
    rm -f /var/cache/oracle-jdk8-installer/jdk-8u*.tar.gz && \
    useradd -u $MY_UID -d /firefox -m firefox

USER firefox

ENTRYPOINT [ "/usr/bin/firefox" ]
