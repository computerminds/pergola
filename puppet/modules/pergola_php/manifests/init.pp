class pergola_php {
  
  include pergola_php::config
  
  #Install PHP
  package { ['php5',
             'php5-suhosin',
             'php5-cgi',
             'php-apc',
             'php5-cli',
             'php5-curl',
             'php5-mysql',
             'php5-gd',
             'php5-sqlite',
             'php5-xmlrpc'
  ]:
    ensure => 'latest',
    notify => Exec["force-reload-apache"],
    
  }
  
  # Set up APC
  file {'/etc/php5/conf.d/apc.ini':
    content => template('pergola_php/apc.ini.erb'),
    notify => Package['php-apc'],
    require => Class['pergola_php::config'],
  }
  
  # Set up php.ini.
  file {'/etc/php5/apache2/php.ini':
    content => template('pergola_php/apache2/php.ini.erb'),
    notify => Package['php-apc'],
    require => Class['pergola_php::config'],
  }
  
  # Pull in the pear class, which will install uploadprogress for us.
  class {'pear':
    require => Package['php5'],
  }
}