# Class: pergola_updater
#
#   This module allows pergola to auto-update.
class pergola_updater {
  include pergola_updater::config

  cron { pergola_updater:
    command => "python /opt/pergola/update.py",
    user => root,
    hour => $::pergola_updater_hour ? {
      undef => 2,
      default => $::pergola_updater_hour,
      },
    minute => 0,
    ensure => $::pergola_updater_enabled ? {
      undef => 'present',
      'false' => 'absent',
      false => 'absent',
      default => 'present',
    },
  }

}
