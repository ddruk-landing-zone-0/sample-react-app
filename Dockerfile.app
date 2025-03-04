# Use an official Node.js image as the base image
FROM node:18-slim

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (to leverage Docker caching)
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the React application
RUN npm run build

# Install serve (a lightweight static server) globally
RUN npm install -g serve

# Command to serve the built React app
CMD ["serve", "-s", "build", "-l", "8080"]

# Expose port 8080 for external access
EXPOSE 8080
