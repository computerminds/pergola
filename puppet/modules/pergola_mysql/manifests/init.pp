# A simple wrapper class around MySQL
class pergola_mysql {
	
	include pergola_mysql::config
	
	if ($::pergola_mysql_status == 'running') {
		$running = 'running'
	}
	else {
		$running = 'stopped'
	}
	
	class { 'mysql::server':
		status => $running,
	}
  
  file {'/etc/mysql/conf.d/pergola.cnf':
    content => template('pergola_mysql/pergola.cnf.erb'),
    notify => Class['mysql::server'], 
  }
	
}