
VIRTUALENV=$(shell which virtualenv)
PYTHON3=$(shell which python3)

clean: 
	rm -Rf env

venv:
	$(VIRTUALENV) -p $(PYTHON3) env

install: clean venv
	. env/bin/activate; pip install -r requirements.txt

freeze:
	. env/bin/activate; pip freeze > requirements.txt

start: 
	. env/bin/activate; python3 devserver.py

gunicorn:
	. env/bin/activate; gunicorn --log-config gunicorn_logging.conf -c gunicorn_config.py pyapi:app