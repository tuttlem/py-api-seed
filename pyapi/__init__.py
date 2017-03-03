
import sys
import logging

from flask import Flask
from flask_restful import Resource, Api

from pyapi.version import info

# Create the top-level flask application objects
app = Flask(__name__)
api = Api(app)

app.logger_name = info['name']

# Import all of this service's route modules
from pyapi import routes
