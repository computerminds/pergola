# vim: tabstop=4 shiftwidth=4 softtabstop=4
import os
import tempfile

from fabric.api import *

from puppet import *

def update():
    '''Update the Pergola system.'''

    _update_git_repo()
    
    run_puppet()
    run_puppet()

def _update_git_repo():
    """Update the git submodules"""
    local('cd /opt/pergola && git pull origin HEAD')
    local('cd /opt/pergola && git submodule init')
    local('cd /opt/pergola && git submodule update')
