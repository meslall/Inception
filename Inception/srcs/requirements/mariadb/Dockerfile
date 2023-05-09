FROM debian:buster

RUN apt-get update && apt install mariadb-server mariadb-client -y

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD [ "./script.sh"]