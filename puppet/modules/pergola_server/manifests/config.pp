define pergola_server::config($type = 'yaml',
							  $source = ''
                              ) {
	$instance = $name
	
	file {"/etc/pergola/$name.$type":
		ensure => 'present',
		replace => false,
		require => File["/etc/pergola"],
		source => $source,
	}
	
	file {"/etc/facts.d/$name.$type":
		ensure => 'link',
		target => "/etc/pergola/$name.$type",
		require => File["/etc/facts.d", "/etc/pergola/$name.$type"],
	}
}