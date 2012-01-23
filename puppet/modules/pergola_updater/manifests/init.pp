# Class: pergola_updater
#
#   This module allows pergola to auto-update.
class pergola_updater {
  cron { pergola_updater:
    command => "python /opt/pergola/update.py",
    user => root,
    hour => 2,
    minute => 0
  }

}
