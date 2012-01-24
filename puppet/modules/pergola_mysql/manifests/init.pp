# A simple wrapper class around MySQL
class pergola_mysql {
	
	if ($::pergola_mysql_status == 'running') {
		$running = 'running'
	}
	else {
		$running = 'stopped'
	}
	
	class { 'mysql::server':
		status => $running,
	}
	
	# Config
	pergola_server::config {'pergola_mysql':
    type => 'yaml',
    source => 'puppet:///modules/pergola_mysql/initial_config.yaml',
  }
	
}