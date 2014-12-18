FROM hpess/nginx
MAINTAINER Paul Cooke <paul.cooke@hp.com>

#RUN cd /opt && \
#    wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz && \
#    tar zxf kibana.tar.gz && \
#    rm -f kibana-3.1.2.tar.gz && \
#    mv kibana-*/* /usr/share/nginx/html/

RUN cd /tmp && \
    wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz && \
    tar zxf kibana-3.1.2.tar.gz && \
    rm kibana-3.1.2.tar.gz && \
    mv kibana-*/* /usr/share/nginx/html/ 

ADD storage/config.js /usr/share/nginx/html/config.js
