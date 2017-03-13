# nginx_source_install Cookbook

This cookbook installs Nginx using my [installer script](https://github.com/MelonSmasher/NginxInstaller) with HTTP2 and ALPN.

## Requirements

### Platforms

- Debian
- Ubuntu
- RedHat
- CentOS

### Chef

- Chef 12.0 or later

## Usage

### nginx_source_install::default

To install the most recent stable version of Nginx:

Just include `nginx_source_install` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nginx_source_install]"
  ]
}
```

### Mainline:

Install the experimental version of NGINX.

Default Value: 

- `false`

Ruby usage:

```ruby
node['nginx']['mainline'] = true
```

JSON usage:

```json
{
  "nginx": {
    "mainline": true
  }
}
```

### Force:

Force the installation even if the version is the same as the one that is installed.

Default Value: 

- `false`

Ruby usage:

```ruby
node['nginx']['force'] = true
```

JSON usage:

```json
{
  "nginx": {
    "force": true
  }
}
```

### Ignore Failure:

Chef will continue it's run even if this script fails.

Default Value: 

- `false`

Ruby usage:

```ruby
node['nginx']['ignore_failure'] = true
```

JSON usage:

```json
{
  "nginx": {
    "ignore_failure": true
  }
}
```

### ALPN Support:

Compile NGINX with ALPN support for http2 ssl support.

Default Value: 

- `true`

Ruby usage:

```ruby
node['nginx']['features']['alpn'] = true
```

JSON usage:

```json
{
  "nginx": {
    "features": {
      "alpn": true
    }
  }
}
```

### Mail Module:

Compile NGINX with the mail module.

Default Value: 

- `false`

Ruby usage:

```ruby
node['nginx']['features']['mail'] = true
```

JSON usage:

```json
{
  "nginx": {
    "features": {
      "mail": true
    }
  }
}
```

### VTS Module:

Compile NGINX with the [VTS module](https://github.com/vozlt/nginx-module-vts).

Default Value: 

- `false`

Ruby usage:

```ruby
node['nginx']['features']['vts'] = true
```

JSON usage:

```json
{
  "nginx": {
    "features": {
      "vts": true
    }
  }
}
```

### GeoIP Module:

Compile NGINX with the geoip module.

Default Value: 

- `false`

Ruby usage:

```ruby
node['nginx']['features']['geoip'] = true
```

JSON usage:

```json
{
  "nginx": {
    "features": {
      "geoip": true
    }
  }
}
```

### PageSpeed Module:

Compile NGINX with Google's [PageSpeed module](https://developers.google.com/speed/pagespeed/).

Default Value: 

- `false`

Ruby usage:

```ruby
node['nginx']['features']['pagespeed'] = true
```

JSON usage:

```json
{
  "nginx": {
    "features": {
      "pagespeed": true
    }
  }
}
```

### Cache Purge Module:

Compile NGINX with the [cache purge module](https://github.com/FRiCKLE/ngx_cache_purge).

Default Value: 

- `false`

Ruby usage:

```ruby
node['nginx']['features']['cache_purge'] = true
```

JSON usage:

```json
{
  "nginx": {
    "features": {
      "cache_purge": true
    }
  }
}
```

### LDAP Auth Module:

Compile NGINX with the [LDAP authentication module](https://github.com/kvspb/nginx-auth-ldap).

Default Value: 

- `false`

Ruby usage:

```ruby
node['nginx']['features']['ldap_auth'] = true
```

JSON usage:

```json
{
  "nginx": {
    "features": {
      "ldap_auth": true
    }
  }
}
```

## License and Authors

Authors: Alex Markessinis

License: [MIT](https://opensource.org/licenses/MIT)

