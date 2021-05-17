## Run hpool chia miner in Docker

### Clone Project
```
git clone https://github.com/gaplo917/hpool-chia-miner-docker.git
```

### Update hpool configuration

1. Update `docker-compose.yaml` to mount `volumes`
2. Update `config.yaml` to config `path`

### Run / Restart (without Version update)
```
docker-compose up
```

### Update hpool miner version

```sh
docker-compose up --build --no-cache
```