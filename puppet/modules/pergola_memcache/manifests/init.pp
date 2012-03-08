class pergola_memcache {
  include pergola_memcache::config
  
  package {['php5-memcached', 'memcached']:
    ensure => $::pergola_memcache_enabled ? {
      undef => 'absent',
      default => 'latest',
      },
    notify => Exec["force-reload-apache"],
  }
  
  file {'/etc/memcached.conf':
    content => template('pergola_memcache/memcached.conf.erb'),
    notify => Package['memcached'],
    require => Class['pergola_memcache::config'],
  }
  
}