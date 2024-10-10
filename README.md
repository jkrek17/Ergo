# Ergo Node Docker Setup

This repository contains Docker configuration for running an Ergo node. Follow these instructions to build, run, and manage your Ergo node using Docker.

## Prerequisites

- Docker installed on your system
- Basic knowledge of Docker and command-line operations

## Quick Start

1. Clone this repository
2. Build the Docker image
3. Run the Ergo node container

## Building the Docker Image

To build the Docker image for the Ergo node:

```bash
docker build -t ergo-node .
```

## Running the Ergo Node

To start the Ergo node:

```bash
docker run --env-file .env -d -p 9032:9030 -p 9055:9053 -v /zDocker/ergo-data:/var/lib/ergo --name ergo-node ergo-node
```

Note: Adjust the volume path (`/z/Docker/ergo-data`) as needed for your system.

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
2. Rebuild the image:
   ```bash
   docker build -t ergo-node .
   ```
3. Stop and remove the old container:
   ```bash
   docker stop ergo-node
   docker rm ergo-node
   ```
4. Start a new container using the "Running the Ergo Node" command above

## Accessing the Container Shell

For advanced troubleshooting:

```bash
docker exec -it ergo-node /bin/sh
```

## Configuration

- The node configuration is stored in `ergo.conf.template`
- Environment variables are set in the `.env` file

## Troubleshooting

If you encounter issues:
1. Check the node logs using the `docker logs` command
2. Ensure all ports are correctly mapped and not in use by other services
3. Verify that the data directory has the correct permissions

## Contributing

Contributions to improve this setup are welcome. Please submit a pull request or open an issue for any enhancements.

## License

[Specify your license here]
