class pergola_postfix {
  include config
  
  # Install postfix
  preseed_package { 'postfix':
    ensure => 'latest',
    module_name => 'pergola_postfix',
  }
  
  service {'postfix':
    ensure => 'running',
  }
  
  file { '/etc/mailname':
    ensure => 'file',
    content => $pergola_postfix::config::hostname,
    notify => Service['postfix'],
  }
  
}