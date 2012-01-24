# A simple wrapper class around MySQL
class pergola_mysql {
	
	
	
	# Config
	pergola_server::config {'pergola_mysql':
    type => 'yaml',
    source => 'puppet:///modules/pergola_mysql/initial_config.yaml',
  }
	
}