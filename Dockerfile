FROM python:3.7-slim-buster
WORKDIR /src
RUN apt-get update && \
    apt-get install bash curl wget nano gnupg lsb-release -y && \
    apt-key adv --keyserver keys.gnupg.net --recv-keys 8C718D3B5072E1F5 && \
    wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.11-1_all.deb && \
    dpkg -i mysql-apt-config_0.8.11-1_all.deb && \
    apt-get update && \
    apt-get install default-mysql-server -y
RUN mkdir -p /var/lib/mysql
RUN service mysql stop
