#added by BW
class sudo {
	package { 'sudo':
		ensure => present,
	}	

	file { '/etc/sudoers':
		owner => "root",
		group => "root",
		mode => 0664,
		source => "puppet:///modules/sudo/etc/sudoers",
		require => Package['sudo'],
	}
}
