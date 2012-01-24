class apache::install {
  
  $module_dir_path = '/etc'
  
  package { ['apache2']:
    ensure => present,
  }
  
  file { "/etc/apache2/sites-enabled/000-default":
    ensure => absent,
    require => Package['apache2'],
  }
  
  # TODO: This has to be replaced by OS-specific configuration redirection
  # into $module_dir_path/apache
  include concat::setup
  concat {
    "/etc/apache2/ports.conf":
      mode => 644, owner => root, group => root,
  }
  file {
    "/etc/apache2/conf.d":
      ensure => directory, checksum => mtime,
      mode => 644, owner => root, group => root,
      require => Package['apache2'],
      notify => Exec["reload-apache"];
    "/etc/apache2/conf.d/charset":
      content => "# This really breaks many apps and pages otherwise\n# Disabled: AddDefaultCharset UTF-8\n",
      mode => 644, owner => root, group => root,
      require => Package['apache2'],
      notify => Exec["reload-apache"];
  }
  
  # always enable output compression
  apache::module { "deflate": ensure => present }
  
  # Notify this when apache needs a reload. This is only needed when
  # sites are added or removed, since a full restart then would be
  # a waste of time. When the module-config changes, a force-reload is
  # needed.
  exec { "reload-apache":
    refreshonly => true,
    before => [ Service["apache2"], Exec["force-reload-apache"] ],
    subscribe => [
      File["/etc/apache2/conf.d"],
      File["/etc/apache2/ports.conf"] ]
  }

  exec { "force-reload-apache":
    refreshonly => true,
    before => Service["apache2"],
  }
  
  Exec["reload-apache"] { command => "/etc/init.d/apache2 reload", }
  Exec["force-reload-apache"] { command => "/etc/init.d/apache2 force-reload", }
  
  package { libapache2-mod-php5:   
  }
}