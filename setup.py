import os

def deploy():
    """Install pre-req packages and fabric, then run fab initialize.

    """
    
    # We probably don't need these, remove them if and when we can.
    packages = [
    #            'python-configobj',
    #            'python-dev',
    #            'python-m2crypto',
    #            'python-mysqldb',
                'python-paramiko',
                'python-pip',
                'python-crypto',
                'python-setuptools',
    #            'python-lxml',
    ]

    os.system('apt-get install -y %s' % ' '.join(packages))
    os.system('pip install fabric==0.9.3')
    os.system('cd /opt/pergola/fab && fab initialize')

if __name__ == '__main__':
    deploy()
