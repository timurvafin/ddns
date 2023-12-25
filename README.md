# # DDNS Docker Container

This Docker container runs a DDNS script every 15 minutes using cron.

## Getting Started

These instructions will cover usage information and how to deploy the container.

### Prerequisites

- Docker
- Docker Compose

### Deploying with Docker Compose

Use the following `docker-compose.yml` example to start the container:

```yaml
version: "3.3"
services:
  ddns-service:
    build: .
    restart: unless-stopped
    environment:
      - TZ=Europe/Moscow
      - PUID=1000
      - PGID=1000
      - AUTH=your_auth
      - TOKEN=your_token
      - ACCOUNT_ID=your_account_id
      - ZONE_ID=your_zone_id
      - RECORD_ID=your_record_id
```

### License

This project is licensed under the MIT License - see the LICENSE file for details.
