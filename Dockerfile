# Use the official Node.js image
FROM node:16

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgbm1 \
    && apt-get clean

# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb && \
    apt-get -f install -y && \
    rm google-chrome-stable_current_amd64.deb

# Install Puppeteer
RUN npm install -g puppeteer

# Copy the script to start the browser
COPY start-browser.js /start-browser.js

# Expose the port
EXPOSE 8080

# Command to run the script
CMD ["node", "/start-browser.js"]
