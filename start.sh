#!/bin/sh

# Substitute environment variables in the template and create the final config
envsubst '${DISCORD_LINK}' < /etc/nginx/templates/nginx.template > /etc/nginx/conf.d/default.conf

# Start Nginx
nginx -g 'daemon off;'
