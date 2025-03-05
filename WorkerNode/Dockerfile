# Use an official Node.js runtime as a base image
FROM node:18-alpine

# We must create the workDir before using it
RUN mkdir -p /home/node
WORKDIR /home/node

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "app.js"]