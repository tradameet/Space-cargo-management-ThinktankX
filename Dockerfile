# Stage 1: Build the application using Node.js
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Set maintainer info
LABEL maintainer="ThinkTankX Team"

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project
COPY . .

# Build the frontend project (e.g., Vite, React, or Vue)
RUN npm run build

# Stage 2: Serve the built app using Nginx
FROM nginx:alpine

# Remove the default Nginx web page
RUN rm -rf /usr/share/nginx/html/*

# Copy the build output from the previous stage
# Update '/app/dist' to '/app/build' if your output folder is 'build'
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
