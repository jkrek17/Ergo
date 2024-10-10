#!/bin/bash

# Generate API key hash
API_KEY_HASH=$(echo -n "${API_KEY_PASSWORD}" | java -jar ergo-${ERGO_VERSION}.jar --mainnet -c ergo.conf.template hash-string)

# Get public IP (this is a simple method, might not work in all environments)
PUBLIC_IP=$(curl -s https://api.ipify.org)

# Prepare ergo.conf
sed -e "s|{{NODE_NAME}}|${NODE_NAME}|g" \
    -e "s|{{API_KEY_HASH}}|${API_KEY_HASH}|g" \
    -e "s|{{PUBLIC_IP}}|${PUBLIC_IP}|g" \
    -e "s|{{DATA_DIR}}|${DATA_DIR}|g" \
    -e "s|{{ENABLE_LITE_NODE}}|${ENABLE_LITE_NODE}|g" \
    -e "s|{{ENABLE_EXTRA_INDEX}}|${ENABLE_EXTRA_INDEX}|g" \
    ${NODE_PATH}/ergo.conf.template > ${NODE_PATH}/ergo.conf

# Start Ergo node
exec java ${JAVA_OPTS} -jar ergo-${ERGO_VERSION}.jar --mainnet -c ergo.conf