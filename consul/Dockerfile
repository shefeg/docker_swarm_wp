FROM consul:latest

RUN apk update && \
apk add --no-cache mysql-client

COPY --chown=consul:consul *.json /consul/config/
COPY --chown=consul:consul *.sh /consul/data/