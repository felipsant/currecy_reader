FROM alpine:3.4
MAINTAINER Felipe Santiago

RUN mkdir -p /var/sc/neo4j/data/
RUN mkdir -p /var/sc/neo4j/test-data/
RUN mkdir -p /var/sc/log/shiny-server/
RUN mkdir -p /var/sc/log/nginx/
RUN mkdir -p /var/sc/mariadb/data/ 
RUN mkdir -p /var/sc/src/ 
RUN mkdir -p /var/sc/mssql/data/ 
RUN mkdir -p /var/sc/mssql/log
# # Create the nginx user
# ARG NGINX_user=nginx
# ARG NGINX_uid=100
# RUN adduser -u ${NGINX_uid} -s /bin/bash -D ${NGINX_user}
# 
# RUN chown -R nginx:nginx /var/sc/log/nginx
# VOLUME ["/var/sc/log/nginx"]

VOLUME ["/var/sc/neo4j/data", "/var/sc/neo4j/test-data", "/var/sc/log/shiny-server", "/var/sc/log/nginx/log", "/var/sc/mssql/data/", "/var/sc/mssql/log"]
CMD ["echo", "Data container"]
