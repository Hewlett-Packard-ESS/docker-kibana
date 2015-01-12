FROM hpess/nginx
MAINTAINER Paul Cooke <paul.cooke@hp.com>

RUN cd /tmp && \
    wget --quiet https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz && \
    tar zxf kibana-3.1.2.tar.gz && \
    rm kibana-3.1.2.tar.gz && \
    mkdir -p /usr/share/nginx/html && \
    mv kibana-*/* /usr/share/nginx/html/ 

COPY storage/config.js /usr/share/nginx/html/config.js
