Pergola
=======

A setup script for a high performance Drupal.

Requirements
------------

Currently Pergola ONLY supports Debian based distributions, notably anything 
other than Ubuntu 10.04 may fail to work.

Installation
------------

### Automatic installation

You can install this via the command line with either 'curl' or 'wget'.

#### via curl

    curl -L https://github.com/computerminds/pergola/raw/master/tools/install.sh | sh

#### via wget

    wget --no-check-certificate https://github.com/computerminds/pergola/raw/master/tools/install.sh -qO - | sh

### Manual installation

(as root)

    apt-get update
    apt-get install git-core
    git clone git://github.com/computerminds/pergola.git -b dev /opt/pergola
    cd /opt/pergola
    python setup.py
