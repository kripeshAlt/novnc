# Use a base image with Node.js and Ubuntu
FROM codercom/code-server:4.10.1

# Set environment variables
ENV PORT=8080

# Expose port 8080 for the web editor
EXPOSE 8080

# Start CodeServer without authentication
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
