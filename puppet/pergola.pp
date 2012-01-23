# Default puppet configuration for pergola.
# Try not to edit this file!
node default {
  class { ntp:
    ensure     => running,
    autoupdate => true,
  }
  
  class {pergola_updater}
}
