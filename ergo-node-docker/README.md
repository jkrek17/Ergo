# Ergo Node Docker Setup

This repository contains Docker configuration files to run an Ergo Node. It provides a streamlined way to set up and run an Ergo node using Docker containers.

## Prerequisites

- Docker
- Docker Compose
- Git (for cloning this repository)
- At least 4GB of RAM
- At least 50GB of free disk space

## Quick Start

1. Clone this repository:
```bash
git clone https://github.com/your-username/ergo-node-docker.git
cd ergo-node-docker
```

2. Copy the example environment file and edit it with your settings:
```bash
cp .env.example .env
```

3. Edit the `.env` file with your preferred settings:
```
VERSION=5.0.24                                    # Ergo node version
NODE_NAME='YOUR NODE NAME HERE - NO QUOTES'       # Your node name
API_KEY_PASSWORD='YOUR PASSWORD HERE - NO QUOTES' # API key password
ERGO_DATA_DIR='/path/to/your/data/directory'     # Data directory path
JAVA_OPTS=-Xmx4g                                 # Java memory options
ENABLE_LITE_NODE=false                           # Enable/disable lite node
ENABLE_EXTRA_INDEX=false                         # Enable/disable extra indexing
```

4. Build and start the node:
```bash
docker-compose up -d
```

## Configuration

### Environment Variables

- `VERSION`: Ergo node version to use
- `NODE_NAME`: Name of your node (visible to other peers)
- `API_KEY_PASSWORD`: Password for API access
- `ERGO_DATA_DIR`: Directory to store blockchain data
- `JAVA_OPTS`: Java VM options (default: `-Xmx4g`)
- `ENABLE_LITE_NODE`: Enable lite node mode (default: `false`)
- `ENABLE_EXTRA_INDEX`: Enable extra indexing (default: `false`)

### Ports

The node exposes the following ports:
- `9030`: P2P network port
- `9053`: REST API port

## Directory Structure

```
.
├── .env                    # Environment configuration
├── docker-compose.yml      # Docker Compose configuration
├── Dockerfile             # Docker image definition
├── entrypoint.sh          # Container entrypoint script
├── ergo.conf.template     # Ergo node configuration template
└── README.md             # This file
```

## Usage

### Starting the Node

```bash
docker-compose up -d
```

### Viewing Logs

```bash
docker-compose logs -f
```

### Stopping the Node

```bash
docker-compose down
```

### Updating the Node

1. Update the VERSION in your `.env` file
2. Rebuild and restart the container:
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

## Data Directory

The blockchain data is stored in the directory specified by `ERGO_DATA_DIR` in your `.env` file. Make sure this directory has enough space and appropriate permissions.

## Maintenance

### Backup

The important data is stored in your `ERGO_DATA_DIR`. Back up this directory regularly.

### Monitoring

You can monitor your node's status through:
- Docker logs: `docker-compose logs -f`
- Ergo node API: `http://localhost:9053/info`

## Security Considerations

- Change the default API key password in the `.env` file
- Don't expose the API port (9053) to the public internet
- Keep your node updated to the latest version
- Regularly check the [official Ergo documentation](https://docs.ergoplatform.com/) for security updates

## Troubleshooting

### Common Issues

1. **Container fails to start**
   - Check logs: `docker-compose logs`
   - Verify environment variables in `.env`
   - Ensure data directory permissions are correct

2. **Node not syncing**
   - Check network connectivity
   - Verify ports 9030 and 9053 are accessible
   - Check disk space in data directory

3. **Out of memory**
   - Adjust `JAVA_OPTS` in `.env` file
   - Ensure host has enough free memory

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Ergo Platform](https://ergoplatform.org/)
- [Ergo Node Documentation](https://docs.ergoplatform.com/node/)