#Created by BW
class nagios_nrpe_server::install {
 package { "nagios-nrpe-server" :
 ensure => latest,
 require => User["nagios"],
 }
 user { "nagios":
 ensure => present,
 gid => "nagios",
 shell => "/bin/false",
 require => Group["nagios"],
 }
 group { "nagios" :
 ensure => present,
 }
}
