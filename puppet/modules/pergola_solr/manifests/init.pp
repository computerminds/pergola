# Pergola class to install Solr and Tomcat.
class pergola_solr {
  
  class {'solr':
    backend => 'tomcat',
    home_dir => '/opt/solr/home',
    data_dir => '/opt/solr/data',
    require => File['/opt/solr'],
  }
  
  file {'/opt/solr':
    ensure => 'directory',
  }

  file { "solr home dir/solr.xml":
    path => "$solr::home_dir/solr.xml",
    content => template('pergola_solr/solr.xml.erb'),
    require => File['solr home dir'],
    notify => Service["tomcat6"],
  }
  
  # Set up the cores
  # This is so nasty, ideally we'd only include the cores.
  pergola_solr::solrcore { "apachesolr-6.x-1.x":
    solrconfig => "puppet:///modules/pergola_solr/apachesolr-6.x-1.x", 
  }
  pergola_solr::solrcore { "apachesolr-6.x-3.x":
    solrconfig => "puppet:///modules/pergola_solr/apachesolr-6.x-3.x", 
  }
  pergola_solr::solrcore { "apachesolr-7.x-1.x":
    solrconfig => "puppet:///modules/pergola_solr/apachesolr-7.x-1.x", 
  }
  pergola_solr::solrcore { "searchapi-7.x-1.x":
    solrconfig => "puppet:///modules/pergola_solr/searchapi-7.x-1.x", 
  }
  
  
  
  
  
}