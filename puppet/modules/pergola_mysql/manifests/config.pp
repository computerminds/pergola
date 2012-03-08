class pergola_mysql::config {
  
  # Config file.
  pergola_server::config {'pergola_mysql':
    type => 'yaml',
    source => 'puppet:///modules/pergola_mysql/initial_config.yaml',
  }
  
  # Process the resulting facts into usable variables.
  if ($::pergola_mysql_innodb_buffer_pool_size == undef) {
    $innodb_buffer_pool_size_float = $::memorysize_raw / 16 / 1024
    $innodb_buffer_pool_size = sprintf('%iM', $innodb_buffer_pool_size_float)
  }
  else {
    $innodb_buffer_pool_size = $::pergola_mysql_innodb_buffer_pool_size
  }
  
  if ($::pergola_mysql_innodb_log_file_size == undef) {
    $innodb_log_file_size = 1073741824
  }
  else {
    $innodb_log_file_size = $::pergola_mysql_innodb_log_file_size
  }
  
  if ($::pergola_mysql_key_buffer_size == undef) {
    $key_buffer_size_float = $::memorysize_raw / 64 / 1024
    $key_buffer_size = sprintf('%iM', $key_buffer_size_float)
  }
  else {
    $key_buffer_size = $::pergola_mysql_key_buffer_size
  }
  
  if ($::pergola_mysql_mysql_max_connections == undef) {
    $mysql_max_connections_float = $::memorysize_raw / 1024 / 50
    $mysql_max_connections = sprintf('%i', $mysql_max_connections_float)
  }
  else {
    $mysql_max_connections = $::pergola_mysql_mysql_max_connections
  }
  
  if ($::pergola_mysql_table_cache == undef) {
    $table_cache = 300  
  }
  else {
    $table_cache = $::pergola_mysql_table_cache
  }
}
