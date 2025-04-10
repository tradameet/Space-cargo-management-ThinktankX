# Stage 1: Build with Node.js
FROM node:18-alpine as builder

WORKDIR /app

# Set maintainer
LABEL maintainer="ThinkTankX Team"

COPY package*.json ./
RUN npm install

COPY . .

# Assuming your build script outputs to the 'public' directory
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy built files from builder stage
COPY --from=builder /app/public /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
