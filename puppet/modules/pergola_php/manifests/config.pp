class pergola_php::config {
  
  # Config file.
  pergola_server::config {'pergola_php':
    type => 'yaml',
    source => 'puppet:///modules/pergola_php/initial_config.yaml',
  }
  
  if ($::pergola_php_memory_limit != false) {
    $memory_limit = '96M'
  }
  else {
    $memory_limit = $::pergola_php_memory_limit
  }
  
  if ($::pergola_php_apc_memory != false) {
    $apc_memory_float = 64 + $::memorysize_raw / 16 / 1024
    $apc_memory = sprintf('%i', $apc_memory_float)
  }
  else {
    $apc_memory = $::pergola_php_apc_memory
  }
  
  if ($::pergola_php_max_execution_time != false) {
    $max_execution_time = '300'
  }
  else {
    $max_execution_time = $::pergola_php_max_execution_time
  }
  
  if ($::pergola_php_upload_max_filesize != false) {
    $upload_max_filesize = '16M'
  }
  else {
    $upload_max_filesize = $::pergola_php_upload_max_filesize
  }
  
  if ($::pergola_php_post_max_size != false) {
    $post_max_size = '18M'
  }
  else {
    $post_max_size = $::pergola_php_post_max_size
  }
}
