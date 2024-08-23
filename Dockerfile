# Base image for Ubuntu with LXDE and VNC
FROM dorowu/ubuntu-desktop-lxde-vnc

# Set environment variables
ENV RESOLUTION 1920x1080

# Expose ports
EXPOSE 80

# Run the command on container start
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

