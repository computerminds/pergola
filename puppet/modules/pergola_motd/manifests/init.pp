# A simple MOTD script for Pergola, why not eh?
class pergola_motd {

  file {'/etc/motd.tail':
    ensure => 'file',
    source => 'puppet:///modules/pergola_motd/motd.tail',
  }

}

