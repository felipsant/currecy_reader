FROM alpine:3.4
#Source --> https://github.com/timhaak/docker-mariadb-alpine
MAINTAINER Felipe Santiago <felipe.santiago@outlook.com>

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    DB_USER="sc_admin" \
    DB_PASS="2343@321w" \
    DB="santiagodb" \  
    TERM="xterm"

RUN apk -U upgrade && \
    apk --update add \
      mariadb mariadb-client \
      && \
      rm -rf /tmp/src && \
      rm -rf /var/cache/apk/*

ADD ./files/my.cnf /etc/mysql/my.cnf
ADD ./files/start.sh /start.sh

RUN chmod u+x /start.sh

EXPOSE 3306

CMD ["/start.sh"]


#arkdeath:dontdie534@mariadb:3306/santiagodb


# FROM alpine:3.4
# #Source --> https://github.com/wangxian/alpine-mysql


# WORKDIR /app
# #VOLUME /app
# COPY startup.sh /app/startup.sh
# RUN chmod 755 startup.sh 

# RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
# COPY my.cnf /etc/mysql/my.cnf

# EXPOSE 3306
# #CMD ["/bin/ash"] 
# CMD ["./startup.sh"]
# #docker run -it --rm -v $(pwd):/app -p 3306:3306 sc_mysql