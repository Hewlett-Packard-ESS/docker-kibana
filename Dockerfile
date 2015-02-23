FROM hpess/nginx
MAINTAINER Paul Cooke <paul.cooke@hp.com>

RUN cd /tmp && \
    wget --quiet https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz && \
    tar zxf kibana-3.1.2.tar.gz && \
    rm kibana-3.1.2.tar.gz && \
    mkdir -p /usr/share/nginx/html && \
    mv kibana-*/* /usr/share/nginx/html/ 

COPY cookbooks/ /chef/cookbooks/

# Set the chef local run list
ENV chef_node_name kibana.docker.local
ENV chef_run_list $chef_run_list,kibana
