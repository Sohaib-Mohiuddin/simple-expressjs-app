# Pull base image from Docker Hub - node 16
FROM node:16

# Create app directory for image
WORKDIR /app

# Copy package.json and package-lock.json to WORKDIR
COPY package*.json ./app

# Install dependencies from package.json
RUN npm install
