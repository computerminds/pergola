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
  
  if ($ensure == "running") {
    varnish::instance { $instance:
      #backend      => "localhost:8080",
      storage    => $storage,
      vcl_file   => $vcl_file,
    }
  }

}
