if [ -d /opt/pergola ]
then
  echo "You have already installed Pergola"
  exit
fi

if [ `whoami` != root ]
then
  echo "You must run the install script as root"
  exit
fi

echo "Installing git"

/usr/bin/env apt-get update
/usr/bin/env apt-get install --yes git-core

echo "Installing pergola"
/usr/bin/env git clone git://github.com/computerminds/pergola.git -b master /opt/pergola

echo "Setting up Pergola"
cd /opt/pergola && /usr/bin/env python setup.py