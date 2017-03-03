
from pyapi import app
from pyapi.version import info

from flask import request
from flask_restful import Resource, abort, reqparse

class VersionRoute(Resource):

  def get(self):
    '''Provides version information about this microservice'''
    return info

