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
