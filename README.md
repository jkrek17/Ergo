# Ergo Node Docker Setup

This repository contains Docker configuration for running an Ergo node using Docker Compose. Follow these instructions to build, run, and manage your Ergo node.

## Prerequisites

- Docker and Docker Compose installed on your system
- Git installed on your system
- Basic knowledge of Docker, Docker Compose, and command-line operations

## Quick Start

1. Clone this repository:
   ```
   git clone https://github.com/jkrek17/Ergo.git
   cd Ergo
   ```

2. Configure the `.env` file
3. Ensure the Docker Compose file is named `docker-compose.yml`
4. Run the Ergo node using Docker Compose

## Configuration

Before running the node, configure the following files:

### .env

Edit the `.env` file and set the following variables:

- `NODE_NAME`: A unique name for your node (e.g., MyErgoNode)
- `API_KEY_PASSWORD`: A secure password for API access
- `ERGO_DATA_DIR`: The path on your host machine where you want to store the Ergo blockchain data (e.g., /path/to/ergo/data)

Optional variables (will use defaults if not set):
- `JAVA_OPTS`: Java options for the Ergo node (default: "-Xmx4g")
- `ENABLE_LITE_NODE`: Set to true for lite node mode (default: false)
- `ENABLE_EXTRA_INDEX`: Set to true to enable extra indexing (default: false)

Example:
```
NODE_NAME=MyErgoNode
API_KEY_PASSWORD=your_secure_password_here
ERGO_DATA_DIR=/c/Docker/ergo-data
JAVA_OPTS=-Xmx8g
ENABLE_LITE_NODE=false
ENABLE_EXTRA_INDEX=false
```

Note: Ensure that the directory specified in `ERGO_DATA_DIR` exists on your host system before running the Docker Compose command. If it doesn't exist, create it first using `mkdir -p /path/to/ergo/data`.

### docker-compose.yml

The `docker-compose.yml` file is pre-configured to use the variables from your `.env` file. You shouldn't need to modify this file unless you want to make advanced changes to your setup.

### ergo.conf.template

This file contains the configuration for your Ergo node. The placeholders will be replaced with actual values when the container starts.

## Running the Ergo Node

To start the Ergo node:

```bash
docker-compose up -d
```

This command will build the Docker image if it doesn't exist and start the container in detached mode.

## Managing the Node

### Stop the Node

```bash
docker-compose down
```

### Restart the Node

```bash
docker-compose restart
```

### View Node Logs

```bash
docker-compose logs
```

### Remove the Container and Volume

If you need to remove the container and its associated volume:

```bash
docker-compose down -v
```

## Updating Ergo Version

1. Update the `ERGO_VERSION` in the Dockerfile
2. Rebuild and restart the container:
   ```bash
   docker-compose up -d --build
   ```

## Troubleshooting

If you encounter issues:
1. Check the node logs using the `docker-compose logs` command
2. Ensure all ports are correctly mapped and not in use by other services
3. Verify that the data directory has the correct permissions

## Contributing

Thanks to ccgarant for introducing me to nodes and guiding my work. 

Contributions to improve this setup are welcome. Please submit a pull request or open an issue for any enhancements.