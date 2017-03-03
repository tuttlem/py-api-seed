FROM python:3

RUN apt-get update && \
  	apt-get install -y python-dev python-setuptools && \
  	apt-get clean && \
  	rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN easy_install pip

WORKDIR /usr/src/app

#
# Add the application code to the docker container and install 
# the package/module dependencies
# 

ADD . /usr/src/app
RUN pip install -r requirements.txt

#
# Kick off the application server now
#

EXPOSE 5000

CMD ["gunicorn", "--log-config", "gunicorn_logging.conf", "-c", "gunicorn_config.py", "pyapi:app"]