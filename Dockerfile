FROM ubuntu:20.04

RUN mkdir -p /chia/hpool

WORKDIR /chia/hpool

ENV HPOOL_GITHUB=https://api.github.com/repos/hpool-dev/chia-miner/releases/latest

RUN apt-get update \
    && apt-get install -y curl jq unzip wget

RUN curl $HPOOL_GITHUB | jq -r '.assets[] | select(.name|contains("linux.zip")) | .browser_download_url' > download_url.txt

RUN wget $(cat download_url.txt) -O tmp.zip \
    && unzip tmp.zip -d ./ \
    && rm tmp.zip

ENTRYPOINT ["/bin/bash", "-l", "-c", "linux/hpool-miner-chia"]