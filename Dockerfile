# Start from a lightweight Node image
FROM node:20-alpine

# Set working directory inside container
WORKDIR /app

# Copy package.json & package-lock.json first for better caching
COPY package*.json ./

# Install dependencies (production only for test speed)
RUN npm install --only=production

# Copy the rest of the project files
COPY . .

# Default command just prints the version from package.json
CMD ["node", "-e", "console.log('App version:', require('./package.json').version)"]
