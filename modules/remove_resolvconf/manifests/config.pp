class remove_resolvconf::config{
 file { "/etc/dhcp/dhclient-enter-hooks.d/resolvconf":
 ensure => absent,
}
}
