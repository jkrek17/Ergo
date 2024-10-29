FROM alpine:3.14

# Build arguments
ARG VERSION

# Set environment variables
ENV VERSION=${VERSION}
ENV NODE_PATH=/opt/ergo
ENV DATA_DIR=/var/lib/ergo

# Add bash and necessary tools
RUN apk add --no-cache bash openjdk11-jre curl wget

# Create Ergo user
RUN adduser -D ergo

# Create directories
RUN mkdir -p ${NODE_PATH} ${DATA_DIR} \
    && chown -R ergo:ergo ${NODE_PATH} ${DATA_DIR}

# Switch to Ergo user
USER ergo
WORKDIR ${NODE_PATH}

# Download Ergo node software with verbose output and verify size
RUN echo "Downloading from: https://github.com/ergoplatform/ergo/releases/download/v${VERSION}/ergo-${VERSION}.jar" && \
    wget --verbose -O ergo-${VERSION}.jar \
    "https://github.com/ergoplatform/ergo/releases/download/v${VERSION}/ergo-${VERSION}.jar" && \
    echo "Download complete. Verifying file:" && \
    ls -l ergo-${VERSION}.jar && \
    if [ ! -s ergo-${VERSION}.jar ]; then \
        echo "Error: Downloaded JAR file is empty" && \
        exit 1; \
    fi

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