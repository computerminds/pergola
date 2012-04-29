class pergola_updater::config {
  
  # Config file.
  pergola_server::config {'pergola_updater':
    type => 'yaml',
    source => 'puppet:///modules/pergola_updater/initial_config.yaml',
  }

}