#!/bin/bash

# Debug information
echo "DEBUG: Current directory: $(pwd)"
echo "DEBUG: Directory contents: $(ls -la)"
echo "DEBUG: VERSION=${VERSION}"
echo "DEBUG: NODE_PATH=${NODE_PATH}"
echo "DEBUG: Looking for jar file: ergo-${VERSION}.jar"

# Check if jar exists
if [ ! -f "ergo-${VERSION}.jar" ]; then
    echo "ERROR: JAR file ergo-${VERSION}.jar not found!"
    exit 1
fi

# Generate API key hash
API_KEY_HASH=$(echo -n "${API_KEY_PASSWORD}" | java -jar ergo-${VERSION}.jar --mainnet -c ergo.conf.template hash-string)

# Get public IP (this is a simple method, might not work in all environments)
PUBLIC_IP=$(curl -s https://api.ipify.org)

# Debug environment variables
echo "DEBUG: NODE_NAME=${NODE_NAME}"
echo "DEBUG: API_KEY_HASH=${API_KEY_HASH}"
echo "DEBUG: PUBLIC_IP=${PUBLIC_IP}"
echo "DEBUG: ENABLE_LITE_NODE=${ENABLE_LITE_NODE}"
echo "DEBUG: ENABLE_EXTRA_INDEX=${ENABLE_EXTRA_INDEX}"

# Prepare ergo.conf
sed -e "s|{{NODE_NAME}}|${NODE_NAME}|g" \
    -e "s|{{API_KEY_HASH}}|${API_KEY_HASH}|g" \
    -e "s|{{PUBLIC_IP}}|${PUBLIC_IP}|g" \
    -e "s|{{DATA_DIR}}|${DATA_DIR}|g" \
    -e "s|{{ENABLE_LITE_NODE}}|${ENABLE_LITE_NODE}|g" \
    -e "s|{{ENABLE_EXTRA_INDEX}}|${ENABLE_EXTRA_INDEX}|g" \
    ${NODE_PATH}/ergo.conf.template > ${NODE_PATH}/ergo.conf

# Start Ergo node
exec java ${JAVA_OPTS} -jar ergo-${VERSION}.jar --mainnet -c ergo.conf
