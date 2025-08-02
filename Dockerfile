# Use lightweight web server image
FROM nginx:alpine

# Clean default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy your static website into Nginx public folder
COPY . /usr/share/nginx/html

# Expose default web port
EXPOSE 80
