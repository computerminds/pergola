# vim: tabstop=4 shiftwidth=4 softtabstop=4
import os
import tempfile

from fabric.api import *

from puppet import *
from mysql import *

def initialize():
    '''Initialize the Pergola system.'''

    _initialize_fabric()
    _initialize_git_repo()
    _initialize_packages()
    _initialize_puppet()
    
    install_mysql()
    run_puppet()
    run_puppet()
    run_puppet()

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

def _initialize_git_repo():
    """Update the git submodules"""
    local('cd /opt/pergola && git submodule init')
    local('cd /opt/pergola && git submodule update')

def _initialize_puppet():
    """Install puppet and set things up."""
    local('apt-get install --yes -t lucid-backports puppet')

def _initialize_packages():
    """Install apt-get and set things up."""
    
    local("echo 'deb http://archive.ubuntu.com/ubuntu lucid-backports main restricted universe multiverse' > /etc/apt/sources.list.d/lucid-backports.list")
    local('touch /etc/apt/preferences.d/lucid-backports-pin-100')
    local("echo 'Package: *' >> /etc/apt/preferences.d/lucid-backports-pin-100")
    local("echo 'Pin: release a=lucid-backports' >> /etc/apt/preferences.d/lucid-backports-pin-100")
    local("echo 'Pin-Priority: 100' >> /etc/apt/preferences.d/lucid-backports-pin-100")
    
    
    local('apt-get update')

    
