# vim: tabstop=4 shiftwidth=4 softtabstop=4
import os
import tempfile

from fabric.api import *

def install_mysql():
    '''Install mysql'''
    local("apt-get --yes install debconf-utils")
    local("echo 'mysql-server-5.1 mysql-server/root_password password root' | debconf-set-selections")
    local("echo 'mysql-server-5.1 mysql-server/root_password seen true' | debconf-set-selections")
    local("echo 'mysql-server-5.1 mysql-server/root_password_again password root' | debconf-set-selections")
    local("echo 'mysql-server-5.1 mysql-server/root_password_again seen true' | debconf-set-selections")
    local("echo 'mysql-server-5.5 mysql-server/root_password password root' | debconf-set-selections")
    local("echo 'mysql-server-5.5 mysql-server/root_password seen true' | debconf-set-selections")
    local("echo 'mysql-server-5.5 mysql-server/root_password_again password root' | debconf-set-selections")
    local("echo 'mysql-server-5.5 mysql-server/root_password_again seen true' | debconf-set-selections")
    local("DPKG_DEBUG=developer DEBIAN_FRONTEND=noninteractive apt-get --yes  install mysql-server")
    local("service mysql stop")
    local("rm -f /var/lib/mysql/ib_log*")
