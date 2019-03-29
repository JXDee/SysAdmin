class puppet_agent::install {
package { "puppet" :
ensure => present,
require => User["puppet"],
}
user { "puppet":
ensure => present,
comment => "Puppet_agent user",
gid => "puppet",
shell => "/bin/false",
require => Group["puppet"],
}
group { "puppet" :
ensure => present,
}
}
