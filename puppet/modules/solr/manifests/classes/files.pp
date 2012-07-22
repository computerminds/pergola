class solr::files {
  exec { "download_solr":
    cwd => "/tmp",
    command => "/usr/bin/wget -c http://archive.apache.org/dist/lucene/solr/3.5.0/apache-solr-3.5.0.tgz",
    creates => ["/tmp/apache-solr-3.5.0.tgz", "/var/lib/tomcat6/webapps/solr.war"],
    timeout => 0,
  }

  exec { "unpack_solr":
    cwd => "/tmp",
    command => "/bin/tar xzf /tmp/apache-solr-3.5.0.tgz",
    creates => ["/tmp/apache-solr-3.5.0", "/var/lib/tomcat6/webapps/solr.war"],
    require => Exec["download_solr"],
  }

  exec { "deploy_solr":
    cwd => "/tmp",
    command => "/bin/mv /tmp/apache-solr-3.5.0/dist/apache-solr-3.5.0.war /var/lib/tomcat6/webapps/solr.war",
    creates => "/var/lib/tomcat6/webapps/solr.war",
    require => Exec["unpack_solr"],
  }

  #exec { "remove_tar":
    #cwd => "/tmp",
    #command => "/bin/rm /tmp/apache-solr-3.4.0.tgz",
    #require => [ Exec["download_solr"], Exec["unpack_solr"] ],
  #}
}
