define preseed_package ( $ensure, $source = false, $module_name = false ) {
  $real_module_name = $module_name ? {
    false => $name,
    default => $module_name,
  }
  $real_source = $source ? {
    false => "puppet:///modules/$real_module_name/$name.preseed",
    default => $source,
  }
  file { "/var/local/preseed/$name.preseed":
    source => $real_source,
    mode => 600,
    backup => false,
    require => File["/var/local/preseed"],
  }
  package { "$name":
    ensure => $ensure,
    responsefile => "/var/local/preseed/$name.preseed",
    require => File["/var/local/preseed/$name.preseed"],
  }
  
  file {'/var/local/preseed':
    ensure => 'directory',
  }
}

