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

### nginx_source_install::mainline

To install the most recent mainline version of Nginx:

Just include `nginx_source_install::mainline` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nginx_source_install::mainline]"
  ]
}
```

## License and Authors

Authors: Alex Markessinis

License: [MIT](https://opensource.org/licenses/MIT)

