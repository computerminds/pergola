class pergola_apache::config {
  
  # Config file.
  pergola_server::config {'pergola_apache':
    type => 'yaml',
    source => 'puppet:///modules/pergola_apache/initial_config.yaml',
  }
  
  if ($::pergola_apache_max_clients == undef) {
    $max_clients_float = $::memorysize_raw / 1024 / 50
    $max_clients = sprintf('%i', $max_clients_float)
  }
  else {
    $max_clients = $::pergola_apache_max_clients
  }
}
