
from pyapi import app, api

from pyapi.routes.util import VersionRoute

api.add_resource(VersionRoute, '/ver')

