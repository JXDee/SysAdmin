class puppet_agent::service {
service { "puppet" :
ensure => running,
hasstatus => true,
hasrestart => true,
enable => true,
require => Class["puppet_agent::config"],
}
}

