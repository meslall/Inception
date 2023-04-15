#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/certificate.key -out /etc/ssl/certs/certificate.crt -subj "/C=MA/ST=BenGuerir/L=BenGuerir/O=1337School/OU=1337School/CN=omeslall"

nginx -g "daemon off;"