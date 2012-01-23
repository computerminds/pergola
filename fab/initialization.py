# vim: tabstop=4 shiftwidth=4 softtabstop=4
import os
import tempfile

from fabric.api import *

import update

def initialize():
    '''Initialize the Pantheon system.'''

    _initialize_fabric()
    _initialize_packages()
    _initialize_puppet()

def init():
    '''Alias of "initialize"'''
    initialize()

def _initialize_fabric():
    """Make symlink of /usr/bin/fab -> /usr/local/bin/fab.

    This is because using pip to install fabric will install it to
    /usr/local/bin but we want to maintain compatibility with existing
    servers and jenkins jobs.
    
    """
    if not os.path.exists('/usr/bin/fab'):
        local('ln -s /usr/local/bin/fab /usr/bin/fab')

def _initialize_puppet():
    """Install puppet and set things up."""
    local('apt-get install -t lucid-backports puppet')

def _initialize_packages():
    """Install apt-get and set things up."""
    
    local("echo 'deb http://archive.ubuntu.com/ubuntu lucid-backports main restricted universe multiverse' > /etc/apt/sources.list.d/lucid-backports.list")
    local('touch /etc/apt/preferences.d/lucid-backports-pin-100')
    local("echo 'Package: *' >> /etc/apt/preferences.d/lucid-backports-pin-100")
    local("echo 'Pin: release a=lucid-backports' >> /etc/apt/preferences.d/lucid-backports-pin-100")
    local("echo 'Pin-Priority: 100' >> /etc/apt/preferences.d/lucid-backports-pin-100")
    
