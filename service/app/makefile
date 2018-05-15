#!/bin/sh
venv: venv/bin/activate;

install:
	( \
    test -d venv || virtualenv venv; \
	. venv/bin/activate; \
	pip install PyMySQL; \
	pip install SqlAlchemy; \
	pip install requests; \
	pip install pytest; \
	pip install pytest-cov; \
	pip freeze -> requirements.txt ;\
	)

run: venv
	venv/bin/python run.py

run2: venv
	venv/bin/python run.py c

run3: venv
	venv/bin/python run.py h

run4: venv
	venv/bin/python run.py k	

test: venv
	venv/bin/pytest --cov=app tests;