class solr::config {
  file { "/opt/solr":
    ensure => directory,
    owner => "tomcat6",
    group => "tomcat6",
  }

  augeas { "solr config":
    changes => [
      "set /files/etc/default/tomcat6/JAVA_OPTS '\"-Djava.awt.headless=true -Dsolr.solr.home=/backpacktv/config/solr -Dsolr.data.dir=/opt/solr -Xmx128m -XX:+UseConcMarkSweepGC\"'",
    ],
    require => File["/opt/solr"],
    notify => Service["tomcat6"],
  }

  file { "/etc/tomcat6/server.xml":
    ensure => present,
    source => "puppet:///modules/solr/etc/tomcat6/server.xml",
    notify => Service["tomcat6"],
  }
}
