class mysql::server($status = 'running') {
  
  if ! ($status in [ "running", "stopped" ]) {
    fail("ensure parameter must be running or stopped")
  }
  
  package { "mysql-server":
    ensure => installed,
  }

  service { mysql:
    ensure => $status,
    hasstatus => true,
    require => Package["mysql-server"],
  }
}
