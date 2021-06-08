# Pull base image from Docker Hub - Alpine Linux
FROM alpine:latest

# Install necessary packages for ReactJS and Flask
RUN apk --update add --no-cache bash nano vim python3-dev py3-pip nodejs npm

# Create app directory for image
WORKDIR /app

# Copy package.json and package-lock.json to WORKDIR
COPY package.json /app

# Install dependencies from package.json / RUN any unix/linux command
RUN npm install

# Copy source files to WORKDIR
COPY . /app

# Execute 'npm start' in cmd / Entry Point
CMD ["npm", "start"]

# Expose port 3000; Also defined in app.js
EXPOSE 3000
