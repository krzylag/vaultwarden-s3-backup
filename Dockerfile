FROM debian:bookworm-slim

ARG BUILDKIT_PROGRESS=plain
ENV BUILDKIT_PROGRESS=${BUILDKIT_PROGRESS}
ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND}

RUN apt-get update && apt-get upgrade -y && apt-get install -y cron python3-boto3 awscli duplicity

RUN mkdir /entrypoint.d
COPY docker/entrypoint.d/* /entrypoint.d
RUN chmod +x /entrypoint.d/*
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir /templates
COPY docker/templates /templates

COPY docker/backup-scripts/* /usr/local/bin
RUN chmod +x /usr/local/bin/*

CMD /entrypoint.sh
