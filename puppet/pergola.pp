# Default puppet configuration for pergola.
# Try not to edit this file!
node default {
  
  # Ensure ntp is installed.
  class { ntp:
    ensure     => running,
    autoupdate => true,
  }
  
  # Ensure the auto updater is around
  include pergola_updater
  
  # Ensure Varnish is installed
  pergola_varnish { 'default'    
  }
  
}
