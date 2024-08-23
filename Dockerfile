# Use the pre-built image
FROM solarkennedy/wine-x11-novnc-docker

# Expose the port
EXPOSE 8080

# No CMD needed as the base image already specifies the startup command
