# Use an official lightweight image like Alpine
FROM alpine:latest

# Install bash and any other dependencies
RUN apk add --no-cache bash curl jq

# Set the working directory inside the container
WORKDIR /app

# Copy the scripts from your local machine to the Docker image
COPY ./scripts /app/scripts
COPY ./entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh
RUN chmod +x /app/scripts/*.sh

# Define the entrypoint command
ENTRYPOINT ["/app/entrypoint.sh"]
