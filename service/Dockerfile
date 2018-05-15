FROM python:2.7-alpine
MAINTAINER Felipe Santiago

RUN apk add --update libffi-dev gcc musl-dev make

RUN mkdir -p /src
ADD app /src/app

WORKDIR /src/app

ENV MACHINE=mariadb:3306

RUN pip install -r requirements.txt

ADD crontab.txt /crontab.txt
COPY entry.sh /entry.sh
RUN chmod 755 /entry.sh
RUN /usr/bin/crontab /crontab.txt



CMD ["/entry.sh"]
