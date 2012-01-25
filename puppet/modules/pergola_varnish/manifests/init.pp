define pergola_varnish($storage="file,/var/varnish/storage1.bin,2G",
                      $ensure="running",
                      $vcl="UNSET") {
  
  $instance = $name
  
  if ($vcl == "UNSET") {
  	$vcl_file = "puppet:///modules/pergola_varnish/drupal.vcl"
  }
  else {
  	$vcl_file = $vcl
  }

  if ! ($ensure in [ "running", "stopped" ]) {
    fail("ensure parameter must be running or stopped")
  }
  
  include varnish
  
  varnish::instance { $instance:
    #backend      => "localhost:8080",
    storage    => $storage,
    vcl_file   => $vcl_file,
  }
  
  file { '/var/varnish/storage1.bin':
    ensure => 'present',
    before => Varnish::Instance[$instance],
    require => File['/var/varnish'],
  }
  
  file { '/var/varnish':
    ensure => 'directory',
  }
  
  if ($ensure == "stopped") {
  	#Service["varnish-${instance}"] {
  	#  ensure +> "stopped",
  	#}
  }

  
  pergola_server::config {'pergola_varnish':
   	type => 'yaml',
   	source => 'puppet:///modules/pergola_varnish/initial_config.yaml',
  }


}
