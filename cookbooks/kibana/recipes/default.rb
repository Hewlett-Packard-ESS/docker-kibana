def default_value(obj, value)
  return value if obj.nil?
  return obj
end

directory '/opt/kibana' do
  owner 'docker'
  group 'docker'
  action :create
  recursive true
end

if File.exist?('/storage/server.key')
  ssl_key = '/storage/server.key'
end

if File.exist?('/storage/server.crt')
  ssl_crt = '/storage/server.crt'
end

if File.exist?('/storage/ca.crt')
  ca = '/storage/ca.crt'
end

config = { 
  :elastic_url  => default_value(ENV['elastic_url'], 'http://elasticsearch:9200'),
  :elastic_user => default_value(ENV['elastic_user'], nil),
  :elastic_pass => default_value(ENV['elastic_pass'], nil),
  :elastic_key  => ssl_key, 
  :elastic_crt  => ssl_crt,
  :elastic_ca   => ca_crt, 
  :kibana_index => default_value(ENV['kibana_index'], '.kibana'),
  :validate_ssl => default_value(ENV['validate_ssl'], 'true')
}

template '/opt/kibana/config/kibana.yml' do
  source    'kibana.yml.erb'
  variables config 
  owner     'docker'
  group     'docker'
  action    :create
end
