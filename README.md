# cs-nginx-blocker

A lua blocker for nginx.

# Installation

Download the latest release [here](https://github.com/crowdsecurity/cs-nginx-blocker/releases)

```bash
tar xvzf cs-nginx-blocker.tgz
cd cs-nginx-blocker-v0.0.1
sudo ./install.sh
```

# How it works

 - deploys `/etc/nginx/conf.d/crowdsec_nginx.conf` with `access_by_lua` directive
 - deploys `/usr/local/lua/crowdsec/access.lua` with the lua code checking incoming IPs against local db

# Testing

When your IP is blocked, any request should lead to a `403` http response.
