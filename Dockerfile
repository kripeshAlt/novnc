# Use an official Node.js base image
FROM zenika/alpine-chrome:with-node

# Set up working directory
WORKDIR /app

# Install necessary packages
RUN apk add --no-cache \
    ttf-freefont \
    harfbuzz \
    nss \
    libx11 \
    libxcomposite \
    libxcursor \
    libxdamage \
    libxrandr \
    libxss \
    libxtst \
    alsa-lib \
    gdk-pixbuf \
    gtk+3.0 \
    mesa-gl \
    opengl \
    ca-certificates

# Expose the port for remote debugging
EXPOSE 9222

# Command to run Chromium
CMD ["chromium-browser", "--headless", "--no-sandbox", "--remote-debugging-port=9222"]
