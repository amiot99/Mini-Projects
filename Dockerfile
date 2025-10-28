# Start with a basic Linux image
FROM ubuntu:22.04

# Install any tools that your script might need
RUN apt-get update && apt-get install -y bash coreutils procps iproute2 curl && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy your script into the container
COPY monitoring_lab/system_report.sh /app/system_report.sh

# Make sure the script can be executed
RUN chmod +x /app/system_report.sh

# Tell Docker what to do when the container starts
CMD ["/bin/bash", "/app/system_report.sh"]
