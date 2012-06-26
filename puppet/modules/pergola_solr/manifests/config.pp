class pergola_solr::config {
  
  # Config file.
  pergola_server::config {'pergola_solr':
    type => 'yaml',
    source => 'puppet:///modules/pergola_solr/initial_config.yaml',
  }
  
}
