class pergola_server() {
  
  # Ensure ntp is installed.
  class { ntp:
    ensure     => running,
    autoupdate => true,
  }
  
  # Ensure the auto updater is around
  class { pergola_updater:
  	
  }
  
  # @TODO: these should really get moved somewhere better.
  file {"/etc/facts.d":
    ensure => 'directory',
  }
  file {"/etc/pergola":
    ensure => 'directory',
  }
  
  # Ensure Varnish is installed
  pergola_varnish { 'drupal':}
  
  # MySQL
  class { pergola_mysql: }
}