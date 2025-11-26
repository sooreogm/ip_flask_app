# Variables
VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(PYTHON) -m pip


.PHONY: create install update run activate docker-build docker-run

create:
	python3 -m venv .ven

install:
	$(PIP) install -r requirements.txt

run: venv
	$(PYTHON) main.py

activate:
	@echo "Run: source .venv/bin/activate"

docker-build:
	docker build -t flask-app .

docker-run:
	docker run -p 9000:5000 flask-app