# Use Alpine Linux as the base image
FROM alpine:3.14

# Set environment variables
ENV ERGO_VERSION=5.0.23
ENV NODE_PATH=/opt/ergo
ENV DATA_DIR=/var/lib/ergo

# Add bash for our entrypoint script
RUN apk add --no-cache bash

# Install OpenJDK and other necessary tools
RUN apk add --no-cache openjdk11-jre curl

# Create Ergo user
RUN adduser -D ergo

# Create directories
RUN mkdir -p ${NODE_PATH} ${DATA_DIR} \
    && chown -R ergo:ergo ${NODE_PATH} ${DATA_DIR}

# Switch to Ergo user
USER ergo
WORKDIR ${NODE_PATH}

# Download Ergo node software
RUN curl -Lo ergo-${ERGO_VERSION}.jar \
    https://github.com/ergoplatform/ergo/releases/download/v${ERGO_VERSION}/ergo-${ERGO_VERSION}.jar

# Copy configuration file and entrypoint script
COPY --chown=ergo:ergo ergo.conf.template ${NODE_PATH}/ergo.conf.template
COPY --chown=ergo:ergo entrypoint.sh ${NODE_PATH}/entrypoint.sh

# Make entrypoint script executable
USER root
RUN chmod +x ${NODE_PATH}/entrypoint.sh
USER ergo

# Expose necessary ports
EXPOSE 9030 9053

# Set the entrypoint
ENTRYPOINT ["/opt/ergo/entrypoint.sh"]