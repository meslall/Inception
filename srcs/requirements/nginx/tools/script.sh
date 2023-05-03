#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/certificate.key -out /etc/ssl/certs/certificate.crt -subj "/C=MA/ST=BenGuerir/L=BenGuerir/O=1337School/OU=1337School/CN=omeslall"

# openssl req -new -x509 -nodes -out /etc/openldap/certs/vmnet.pem -keyout /etc/openldap/certs/vmnet.pem -days 365  -subj "/C=MA/ST=BenGuerir/L=BenGuerir/O=1337School/OU=1337School/CN=omeslall"
# chown -R  ldap:ldap /etc/openldap/certs/*.pem
# yum -y install mod_ssl
# mkdir /etc/ssl/private
# chmod 700 /etc/ssl/private/
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/certificate.key -out /etc/ssl/certs/certificate.crt -subj "/C=MA/ST=BenGuerir/L=BenGuerir/O=1337School/OU=1337School/CN=omeslall"

nginx -g "daemon off;"