# Use Node.js runtime
FROM node:20-alpine

# Folder inside the container
WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the remaining application files
COPY . .

# Document the port used by the application
EXPOSE 5050

# Start the Node.js server
CMD ["npm", "start"]