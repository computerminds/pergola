# Create a Listen directive for apache in ports.conf
# Use the $name to disambiguate between requests for the same port from
# different modules
define apache::port($port) {
  concat::fragment {
    "apache::port::${name}":
    target => "/etc/apache2/ports.conf",
    content => "Listen ${port}\n";
  }
}