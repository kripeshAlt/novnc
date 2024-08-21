# Use an official Node.js image as a parent image
FROM node:16

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    curl \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    libnss3 \
    libgbm1 \
    libgtk-3-0 \
    && apt-get clean

# Install Chromium
RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable

# Install Puppeteer
RUN npm install -g puppeteer

# Copy the script to start the browser
COPY start-browser.js /start-browser.js

# Expose the port
EXPOSE 8080

# Command to run the script
CMD ["node", "/start-browser.js"]
