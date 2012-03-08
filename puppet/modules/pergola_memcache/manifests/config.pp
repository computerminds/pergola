class pergola_memcache::config {
  
  # Config file.
  pergola_server::config {'pergola_memcache':
    type => 'yaml',
    source => 'puppet:///modules/pergola_memcache/initial_config.yaml',
  }
  
  if ($::pergola_memcache_memory == undef) {
    $memcache_memory_float = $::memorysize_raw / 16 / 1024
    $memcache_memory = sprintf('%i', $memcache_memory_float)
  }
  else {
    $memcache_memory = $::pergola_memcache_memory
  }

}