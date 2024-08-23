# Use the official base image
FROM vital987/chrome-novnc:latest

# Set environment variables
ENV PORT=8080
ENV VNC_PASS=CHANGE_IT

# Expose the port
EXPOSE 8080

# Start the container with the necessary command
CMD ["start.sh"]
