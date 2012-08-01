class pergola_security::components::iptables {
  # Taken from:
  # http://projects.puppetlabs.com/projects/1/wiki/Module_Iptables_Patterns#Alternate+method


  package {
    "iptables-persistent": ensure => present;
  }

  service { "iptables-persistent":
    require => Package["iptables-persistent"],

    # Because there is no running process for this service, the normal status
    # checks fail.  Because puppet then thinks the service has been manually
    # stopped, it won't restart it.  This fake status command will trick puppet
    # into thinking the service is *always* running (which in a way it is, as
    # iptables is part of the kernel.)
    hasstatus => true,
    status => "true",

    # Under Debian, the "restart" parameter does not reload the rules, so tell
    # Puppet to fall back to stop/start, which does work.
    hasrestart => false,

  }

  file {
    "/etc/iptables/rules":
      owner   => "root",
      group   => "root",
      mode    => 640,
      source  => "puppet:///modules/pergola_security/iptables.rules",
      require => Package["iptables-persistent"],
      replace => false,

      # When this file is updated, make sure the rules get reloaded.
      notify  => Service["iptables-persistent"],
  }

  # Needed for Precise.
  file {
    "/etc/iptables/rules.v4":
      owner   => "root",
      group   => "root",
      mode    => 640,
      source  => "puppet:///modules/pergola_security/iptables.rules",
      require => Package["iptables-persistent"],
      replace => false,

      # When this file is updated, make sure the rules get reloaded.
      notify  => Service["iptables-persistent"],
  }


}
