# Use linuxserver/baseimage-alpine as base image
FROM linuxserver/baseimage-alpine

# Set the working directory to /config
WORKDIR /config

# Update package list and install bash and curl
RUN apk update && apk add bash curl

# Copy the DDNS script into the container and place it in /etc/periodic/15min
COPY ddns.sh /etc/periodic/15min/ddns

# Make sure the script is executable
RUN chmod +x /etc/periodic/15min/ddns

# Run crond in the foreground with detailed logging
CMD ["crond", "-l", "2", "-f"]
