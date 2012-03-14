# vim: tabstop=4 shiftwidth=4 softtabstop=4
import os
import tempfile

from fabric.api import *

def puppet():
    run_puppet('true')

def run_puppet(color='true'):
    """run puppet to get the config applied."""
    local('puppet apply --color=%s --verbose --modulepath=/opt/pergola/puppet/modules /opt/pergola/puppet/pergola.pp' % color, capture=False)
