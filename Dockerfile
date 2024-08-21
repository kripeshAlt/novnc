# Use a base image with Node.js and Chromium
FROM zenika/alpine-chrome:with-node

# Set up working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port if needed (default for Puppeteer is not required but included for completeness)
EXPOSE 9222

# Run the application
CMD ["node", "index.js"]
