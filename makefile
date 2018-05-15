#!/bin/sh
run: 
	docker exec -it santiagocloud_currency_service_1 python run.py c;
run2: 
	docker exec -it santiagocloud_currency_service_1 python run.py h;

build:
	@docker-compose build
run:
	@docker-compose up -d resume
run-db:
	@docker-compose up -d neo4j mariadb 
run-db-test:
	@docker-compose up -d neo4jtest
down-db-test:
	@docker-compose stop neo4jtest
clean:
	@docker-compose down
test:
	@docker-compose run web pytest --cov=api tests
run-currency-service:
	@docker-compose run currency_service python run.py
run-currency-service-historical:
	@docker-compose run currency_service python run.py h
