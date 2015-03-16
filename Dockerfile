FROM hpess/chef:master
MAINTAINER Karl Stoney <karl.stoney@hp.com> 

RUN cd /opt && \
    wget --quiet https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz && \ 
    tar zxf kibana-*.tar.gz && \
    rm kibana-*.tar.gz && \
    mv kibana-* kibana && \
    chown -R docker:docker /opt/kibana

COPY services/* /etc/supervisord.d/
COPY cookbooks/ /chef/cookbooks/

# Set the correct user permissions on the files
RUN chown -R docker:docker /opt/kibana && \
    chown -R docker:docker /storage

EXPOSE 5601

ENV HPESS_ENV kibana
ENV chef_node_name kibana.docker.local
ENV chef_run_list kibana
