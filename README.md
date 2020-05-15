# CrowdSec NGINX Blocker

A lua blocker for nginx.


# Documentation

Please find the documentation [here](https://docs.crowdsec.net/blockers/nginx/installation/).

# Installation

## Install script

Download the latest release [here](https://github.com/crowdsecurity/cs-nginx-blocker/releases)

```bash
tar xvzf cs-nginx-blocker.tgz
cd cs-nginx-blocker-v0.0.1
sudo ./install.sh
```

:warning: the installation script works only on Debian/Ubuntu

## From source

### Requirements

The following packages are required :

- lua
- lua-sql-sqlite3
- lua-logging
- libnginx-mod-http-lua

#### Debian/Ubuntu

```
sudo apt-get install lua5.3 libnginx-mod-http-lua lua-sql-sqlite3 lua-logging
```

Download the following 2 repositories:

- [`cs-lua-lib`](https://github.com/crowdsecurity/cs-lua-lib):
```
git clone https://github.com/crowdsecurity/cs-lua-lib.git
```

- [`cs-nginx-blocker`](https://github.com/crowdsecurity/cs-nginx-blocker)
```
git clone https://github.com/crowdsecurity/cs-nginx-blocker.git
```

### Installation

#### cs-lua-lib

- Create folder `/usr/local/lua/crowdsec/`:
```
mkdir -p /usr/local/lua/crowdsec/
```

- Copy the `cs-lua-lib/lib/*.lua` into `/usr/local/lua/crowdsec/`:
```
cp ./cs-lua-lib/lib/*.lua /usr/local/lua/crowdsec
```

- Copy the `cs-lua-lib/template.conf` into `/usr/local/lua/crowdsec/crowdsec.conf`:
```
cp ./cs-lua-lib/template.conf /usr/local/lua/crowdsec/crowdsec.conf
```

#### cs-nginx-blocker

- Copy the `cs-nginx-blocker/nginx/crowdsec_nginx.conf` into `/etc/nginx/conf.d/crowdsec_nginx.conf`:
```
cp ./cs-nginx-blocker/nginx/crowdsec_nginx.conf /etc/nginx/conf.d/crowdsec_nginx.conf
```
- Copy the `cs-nginx-blocker/nginx/access.lua` into `/usr/local/lua/crowdec/access.lua`:
```
cp ./cs-nginx-blocker/nginx/access.lua /usr/local/lua/crowdec/access.lua
```

You can now restart your nginx server:
```
systemctl restart nginx
```


# How it works

 - deploys `/etc/nginx/conf.d/crowdsec_nginx.conf` with `access_by_lua` directive
 - deploys `/usr/local/lua/crowdsec/access.lua` with the lua code checking incoming IPs against local db

# Testing

When your IP is blocked, any request should lead to a `403` http response.
