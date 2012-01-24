class apache::service($status = 'running',
                      $apache_port
) {
  
  include apache
  
  service { "apache2":
    ensure => $status,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class['apache::install'],
  }
  
  $apache_port_real = $apache_port ? { '' => 80, default => $apache_port }

  apache::port { "apache_class": port => $apache_port_real }
}