FROM alpine:latest

RUN apk update && apk upgrade && apk add bash supervisor aws-cli duplicity

RUN mkdir /root/entrypoint.d
COPY docker/entrypoint.d/* /root/entrypoint.d
RUN chmod +x /root/entrypoint.d/*
COPY docker/entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

COPY docker/supervisor/supervisord.conf /etc/supervisord.conf
RUN mkdir /etc/supervisor.d
COPY docker/supervisor/app-cron.ini /etc/supervisor.d
RUN mkdir /var/log/supervisor

RUN mkdir /root/templates
COPY docker/templates /root/templates

COPY docker/backup-scripts/* /usr/local/bin
RUN chmod +x /usr/local/bin/backup-run
RUN chmod +x /usr/local/bin/backup-restore

CMD /root/entrypoint.sh
