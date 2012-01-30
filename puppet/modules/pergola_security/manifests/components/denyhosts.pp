class pergola_security::components::denyhosts {
  package {'denyhosts':
    ensure => 'latest',
    
  }
  
  file {'/etc/denyhosts.conf':
    ensure => 'file',
    source => 'puppet:///modules/pergola_security/denyhosts.conf',
    notify => Service['denyhosts'],
  }
  
  service {'denyhosts':
    ensure => 'running',
    hasstatus => false,
    subscribe => File['/etc/denyhosts.conf'],
  }
}