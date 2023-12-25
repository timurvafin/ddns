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
      # get from https://ddns.horse/
      - TOKEN=your_token
      # https://dnsimple.com/a/ACCOUNT_ID/domains/ZONE_ID/records/RECORD_ID/edit
      - ACCOUNT_ID=your_account_id
      # full hostname for your external ip
      - HOSTNAME=ddns.example.com
```

### License

This project is licensed under the MIT License - see the LICENSE file for details.
