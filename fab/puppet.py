# vim: tabstop=4 shiftwidth=4 softtabstop=4
import os
import tempfile

from fabric.api import *

def run_puppet():
    """run puppet to get the config applied."""
    local('puppet apply --verbose --modulepath=/opt/pergola/puppet/modules /opt/pergola/puppet/pergola.pp', capture=False)
