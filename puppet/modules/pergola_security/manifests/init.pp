class pergola_security {
  
  class { 'components::denyhosts':}
  class { 'components::iptables':}
  
}