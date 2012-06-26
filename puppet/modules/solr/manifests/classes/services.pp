class solr::services {
  service { "tomcat6":
      ensure => "running",
      enable => "true",
    }
}
