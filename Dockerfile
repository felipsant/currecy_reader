FROM python:2.7-alpine
MAINTAINER Felipe Santiago

RUN apk add --update libffi-dev gcc musl-dev make linux-headers curl
RUN apk add --update nodejs git
RUN npm install -g bower

RUN mkdir -p /src
ADD app /src/app


WORKDIR /src/app/api/static
RUN npm install
RUN bower install --allow-root

WORKDIR /src/app
RUN rm -rf venv
RUN rm -rf tests/.cache
RUN rm -rf .cache
RUN find . -name "*.pyc" -exec rm -f {} \;
ENV DIAG_CONFIG_MODULE=api.config.ProductionConfig

ENV MACHINE=mariadb:3306

RUN pip install -r requirements.txt

EXPOSE 5002
CMD ["uwsgi","--socket", "0.0.0.0:5002", "--protocol=http", "-w", "run:app"]
