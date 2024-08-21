# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables to non-interactive to avoid prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    xrdp \
    xfce4 \
    xfce4-goodies \
    novnc \
    websockify \
    supervisor \
    curl \
    && apt-get clean

# Setup xrdp
RUN adduser xrdp ssl-cert
RUN echo "xfce4-session" >~/.xsession

# Install noVNC
RUN mkdir -p /usr/share/novnc
RUN curl -L https://github.com/novnc/noVNC/archive/refs/heads/master.zip -o noVNC.zip && \
    unzip noVNC.zip -d /usr/share/novnc && \
    rm noVNC.zip

# Copy configuration files
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Expose ports for RDP and noVNC
EXPOSE 3389 80

# Start the supervisor service
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
