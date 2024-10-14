# Use the official Nginx image as the base image
FROM nginx:alpine

# Install envsubst to handle environment variable substitution
RUN apk add --no-cache gettext

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy the template configuration file to the container
COPY nginx.template /etc/nginx/templates/nginx.template

# Copy a script to start Nginx with environment variable substitution
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port 80
EXPOSE 80

# Set the entrypoint to our start script
ENTRYPOINT ["/start.sh"]
