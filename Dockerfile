# Use official Nginx image as base
FROM nginx:alpine

# Set maintainer
LABEL maintainer="ThinkTankX Team"

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML/CSS/JS files into nginx web directory
COPY public/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
