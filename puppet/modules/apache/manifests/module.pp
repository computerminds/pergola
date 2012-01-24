# Define an apache module. Debian packages place the module config
# into /etc/apache/mods-available.
#
# You can add a custom require (string) if the module depends on 
# packages that aren't part of the default apache package. Because of 
# the package dependencies, apache will automagically be included.
define apache::module ( $ensure = 'present', $require_package = 'apache2' ) {
  $mods = "/etc/apache2/mods"
  case $ensure {
    'present' : {
      exec { "/usr/sbin/a2enmod $name":
        unless => "/bin/sh -c '[ -L ${mods}-enabled/${name}.load ] \\
          && [ ${mods}-enabled/${name}.load -ef ${mods}-available/${name}.load ]'",
        notify => Exec["force-reload-apache"],
        require => Package[$require_package],
      }
    }
    'absent': {
      exec { "/usr/sbin/a2dismod $name":
        onlyif => "/bin/sh -c '[ -L ${mods}-enabled/${name}.load ] \\
          && [ ${mods}-enabled/${name}.load -ef ${mods}-available/${name}.load ]'",
        notify => Exec["force-reload-apache"],
        require => Package["apache2"],
      }
    }
  }
}