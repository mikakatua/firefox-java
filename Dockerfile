FROM i386/ubuntu:18.04

ARG MY_UID
ARG JAVA_JRE=jre-8u221-linux-i586.tar.gz
ARG FIREFOX_ESR=firefox-52.9.0esr.tar.bz2

COPY soft/$JAVA_JRE /tmp
RUN tar xf /tmp/$JAVA_JRE -C /opt && rm -f /tmp/$JAVA_JRE && ln -rs /opt/jre* /opt/java
ENV PATH="/opt/java/bin:${PATH}"

COPY soft/$FIREFOX_ESR /tmp
RUN tar xf /tmp/$FIREFOX_ESR -C /opt && rm -f /tmp/$FIREFOX_ESR && mkdir -p /usr/lib/mozilla/plugins && ln -s /opt/java/lib/i386/libnpjp2.so /usr/lib/mozilla/plugins

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libgtk-3-0 libdbus-glib-1-2 libx11-xcb1 libxt6 libgtk2.0-0 ca-certificates-java && \
    useradd -l -u $MY_UID -d /firefox -m firefox

USER firefox
CMD [ "/opt/firefox/firefox" ]
