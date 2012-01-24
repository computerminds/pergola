# A simple wrapper class around MySQL
class pergola_apache {
	
	include pergola_apache::config
	
	if ($::pergola_apache_status == 'running') {
		$running = 'running'
	}
	else {
		$running = 'stopped'
	}
	
	class {'apache::service':
	  status => $running,
	  apache_port => 8080,
	}
	
	# Enable some modules for apache
  apache::module { "rewrite": ensure => present }
  apache::module { "php5": ensure => present }
	/*
	
	class { 'mysql::server':
		status => $running,
	}
  
  file {'/etc/mysql/conf.d/pergola.cnf':
    content => template('pergola_mysql/pergola.cnf.erb'),
    notify => Class['mysql::server'], 
  }
	*/
	
}