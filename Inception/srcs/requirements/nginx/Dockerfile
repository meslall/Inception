FROM debian:buster

RUN apt -y update && apt install -y nginx && apt install openssl -y

COPY ./tools/script.sh /
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf
# /etc/nginx/conf.d/
# COPY conf/default /etc/nginx/sites-available/
# COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /script.sh

# COPY ./conf/default /etc/nginx/sites-available/

CMD [ "./script.sh" ]