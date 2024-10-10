# Ergo Node Docker Setup

This repository contains Docker configuration for running an Ergo node. Follow these instructions to build, run, and manage your Ergo node using Docker.

## Prerequisites

- Docker installed on your system
- Git installed on your system
- Basic knowledge of Docker and command-line operations

## Quick Start

1. Clone this repository:
   ```
   git clone https://github.com/jkrek17/Ergo.git
   cd Ergo
   ```

2. Configure the `.env` file
3. Build the Docker image
4. Run the Ergo node container

## Configuration

Before running the node, configure the following files:

### .env

Edit the `.env` file and set the following variables:

- `NODE_NAME`: A unique name for your node (e.g., MyErgoNode)
- `API_KEY_PASSWORD`: A secure password for API access

Example:
```
NODE_NAME=MyErgoNode
API_KEY_PASSWORD=your_secure_password_here
```

### ergo.conf.template

This file contains the configuration for your Ergo node. The placeholders will be replaced with actual values when the container starts.

## Building the Docker Image

To build the Docker image for the Ergo node:

```bash
docker build -t ergo-node .
```

## Running the Ergo Node

To start the Ergo node:

```bash
docker run --env-file .env -d -p 9030:9030 -p 9053:9053 -v /path/to/ergo/data:/var/lib/ergo --name ergo-node ergo-node
```

Note: Replace `/path/to/ergo/data` with the actual path where you want to store the Ergo blockchain data on your host machine.

## Managing the Node

### Stop the Node

```bash
docker stop ergo-node
```

### Restart the Node

```bash
docker restart ergo-node
```

### View Node Logs

```bash
docker logs ergo-node
```

### Remove the Container

If you need to remove the container (e.g., for a fresh start):

```bash
docker rm ergo-node
```

## Updating Ergo Version

1. Update the `ERGO_VERSION` in the Dockerfile
2. Rebuild the image
3. Stop and remove the old container
4. Start a new container

## Troubleshooting

If you encounter issues:
1. Check the node logs using the `docker logs` command
2. Ensure all ports are correctly mapped and not in use by other services
3. Verify that the data directory has the correct permissions

## Contributing

Thanks to ccgarant to introducing me to nodes and guiding my work. 

Contributions to improve this setup are welcome. Please submit a pull request or open an issue for any enhancements.