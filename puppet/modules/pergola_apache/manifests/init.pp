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
  
  file {'/etc/apache2/apache2.conf':
    content => template('pergola_apache/apache2.conf.erb'),
    notify => Class['apache::service'],
    require => Class['pergola_apache::config'], 
  }
	
	
}