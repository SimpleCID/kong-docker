#!/bin/sh
set -e

# Installing luarocks plugins
if [[ ! -z "$LUA_PLUGINS" ]]; then
  luarocks install $LUA_PLUGINS
fi

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

# Setting default prefix (override any existing variable)
export KONG_PREFIX="/usr/local/kong"

# Prepare Kong prefix
if [ "$1" = "/usr/local/openresty/nginx/sbin/nginx" ]; then
	kong prepare -p "/usr/local/kong"
fi

exec "${@}"


