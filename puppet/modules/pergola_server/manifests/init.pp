class pergola_server() {
  
  # Ensure ntp is installed.
  class { ntp:
    ensure     => running,
    autoupdate => true,
  }
  
  # Ensure the auto updater is around
  class { pergola_updater:
  	
  }
  
  # Ensure Varnish is installed
  pergola_varnish { 'drupal':
    ensure => 'stopped',
   }
   
   file {'/etc/pergola':
   	ensure => 'directory',
   }
   
   file {'/etc/pergola/pergola_server.yaml':
   	ensure => 'present',
   	source => 'puppet:///modules/pergola_server/initial_config.yaml',
   	require => File['/etc/pergola'],
   	replace => false,
   }
}