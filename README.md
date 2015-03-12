![Kibana](/kibana.png?raw=true "Kibana")

This container builds on hpess/chef by adding Kibana. Currently installing kibana 4.0.1

## Use
It's pretty simple, here is an example docker compose file with all available parameters:
```
kibana:
  image: hpess/kibana
  ports:
    - "5601:5601"
  environment:
    elastic_url:  'http://your-elastic-server:9200'
    elastic_user: 'username'
    elastic_pass: 'password'
    kibana_index: '.kibana'
    validate_ssl: 'true'
```
The defaults for all of these are:
```
  elastic_url:  'http://elasticsearch:9200'
  elastic_user: nil
  elastic_pass: nil
  kibana_index: '.kibana'
  validate_ssl: true
```

## SSL Certificates
If you want kibana to provide a CA certificate for your elastic search instance, simply drop it into /sotrage/ca.pem

If you want to use a key and certificate for outgoing kibana requests, simply drop them into /storage/server.key and /storage/server.crt

## License
This docker application is distributed unter the MIT License (MIT).

Kibana itself is licenced under the [Apache](https://github.com/elastic/kibana/blob/master/LICENSE.md) License.
