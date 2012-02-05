class pergola_postfix::config {
  
  # Config file.
  pergola_server::config {'pergola_postfix':
    type => 'yaml',
    source => 'puppet:///modules/pergola_postfix/initial_config.yaml',
  }
  
  if ($::pergola_postfix_hostname == false) {
    $hostname = $::hostname
  }
  else {
    $hostname = $::pergola_postfix_hostname
  }

}