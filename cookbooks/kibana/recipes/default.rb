def default_value(val, default)
  if val.nil?
    return default
  end
  if val.is_a? Numeric
    return BigDecimal.new(val).to_i
  elsif val.downcase === 'true'
    return true
  elsif val.downcase === 'false'
    return false
  else
    return val
  end
end

kibanaConfig = {
  :elasticsearch_url => default_value(ENV['elasticsearch_url'], '127.0.0.1')
}

template '/usr/share/nginx/html/config.js' do
  source 'config.erb'
  user 'docker'
  group 'docker'
  variables ({ :confvars => kibanaConfig })
end
