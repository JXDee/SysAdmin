class puppet_agent::config {
file { "/etc/puppet/puppet.conf":
ensure => present,
source => "puppet:///modules/puppet_agent/puppet.conf",
mode => 0664,
owner => "root",
group => "root",
require => Class["puppet_agent::install"],
notify => Class["puppet_agent::service"],
}
}
