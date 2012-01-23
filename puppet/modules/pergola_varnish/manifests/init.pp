define pergola_varnish($storage="malloc",
                      $ensure="running",
                      $vcl="UNSET") {
  
  $instance = $name
  
  if ! ($ensure in [ "running", "stopped" ]) {
    fail("ensure parameter must be running or stopped")
  }
  
  include varnish
  
  if ($ensure == "running") {
    varnish::instance { $instance:
      #backend      => "localhost:8080",
      vcl_file   => "puppet:///modules/pergola_varnish/drupal.vcl"
    }
  }

}
