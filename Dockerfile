FROM python:3

RUN apt-get update && \
  	apt-get install -y python-dev python-setuptools && \
  	apt-get clean && \
  	rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN easy_install pip
RUN pip install virtualenv

#
# Add the application code to the docker container and install 
# the package/module dependencies
# 

ADD . /usr/src/app
WORKDIR /usr/src/app

RUN make install

#
# Kick off the application server now
#

EXPOSE 5000

# CMD ["gunicorn", "--log-config", "gunicorn_logging.conf", "-c", "gunicorn_config.py", "pyapi:app"]
CMD ["make", "gunicorn"]