class pergola_drush::install {
    pparepo { "brianmercer/drush":
      apt_key => "8D0DC64F",
      ensure => 'present',
      dist => 'lucid',
    }
    
    package {'drush':
      require => Pparepo['brianmercer/drush'],
      ensure => 'latest',
    }
}