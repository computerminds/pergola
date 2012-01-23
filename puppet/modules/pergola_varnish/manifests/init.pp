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
      #address      => ["192.168.1.10:80"],
      #admin_port   => "6082",
      #storage        => ["file,/var/varnish/storage1.bin,90%",
      #                   "file,/var/varnish/storage2.bin,90%"],
      #params       => ["thread_pool_min=1",
      #                 "thread_pool_max=1000",
      #                 "thread_pool_timeout=120"],
      vcl_file   => "puppet:///modules/pergola_varnish/varnish.vcl"
    }
  }

}
