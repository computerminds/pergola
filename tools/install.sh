if [ -d /opt/pergola ]
then
  echo "You have already installed Pergola"
  exit
fi

echo "Installing git"

/usr/bin/env apt-get update
/usr/bin/env apt-get install --yes git-core

echo "Installing pergola"
/usr/bin/env git clone git://github.com/computerminds/pergola.git -b dev /opt/pergola

echo "Setting up Pergola"
/usr/bin/env cd /opt/pergola && python setup.py