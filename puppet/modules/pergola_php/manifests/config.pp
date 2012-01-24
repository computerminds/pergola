class pergola_php::config {
  
  # Config file.
  pergola_server::config {'pergola_php':
    type => 'yaml',
    source => 'puppet:///modules/pergola_php/initial_config.yaml',
  }
  
  if ($::pergola_php_apc_memory != false) {
    $apc_memory_float = 64 + $::memorysize_raw / 16 / 1024
    $apc_memory = sprintf('%i', $apc_memory_float)
  }
  else {
    $apc_memory = $::pergola_php_apc_memory
  }
}
