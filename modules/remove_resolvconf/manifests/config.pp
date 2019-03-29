class remove_resolvconf::config{
 file { "/run/resolv/resolv.conf":
 ensure => absent,
}
}
